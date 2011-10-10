Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDMhL-0004O9-K6 for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 22:43:43 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AKiWxe013318; Mon, 10 Oct 2011 21:44:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f4VBn6LSfcMp; Mon, 10 Oct 2011 21:44:32 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AKiTQX013313
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 10 Oct 2011 21:44:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 21:37:48 +0100
In-Reply-To: <CAEsOVNfpf97anznqn8ZqgOXmJEZp3sA4pK7aALT2w=3G2SjPbA@mail.gmail.com>
References: <1317685187-9041-1-git-send-email-msm@freescale.com>
	<CAEsOVNdbpyesRT7UHdcXWMmp8fv1Wiyx6dUiTi40AVNgaOogGQ@mail.gmail.com>
	<CAEsOVNfpf97anznqn8ZqgOXmJEZp3sA4pK7aALT2w=3G2SjPbA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318279077.23801.64.camel@ted>
Mime-Version: 1.0
Subject: Re: [RFC] Fix typo in meta/classes/sanity.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2011 20:43:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-10 at 18:21 +0000, McClintock Matthew-B29882 wrote:
> Ping? Any comments?
> 
> -M
> 
> On Mon, Oct 3, 2011 at 6:48 PM, McClintock Matthew-B29882
> <B29882@freescale.com> wrote:
> > On Mon, Oct 3, 2011 at 6:39 PM, Matthew McClintock <msm@freescale.com> wrote:
> >> Signed-off-by: Matthew McClintock <msm@freescale.com>
> >
> > Whoops =)
> >
> >> ---
> >> Not sure if this is correct but it looks like a typo, also
> >> there appears to be some issues with the fix as well
> >>
> >>  meta/classes/sanity.bbclass |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> >> index 4067408..cf30927 100644
> >> --- a/meta/classes/sanity.bbclass
> >> +++ b/meta/classes/sanity.bbclass
> >> @@ -169,7 +169,7 @@ def check_sanity_validmachine(e):
> >>         messages = messages + 'TUNE_ARCH is unset. Please ensure your MACHINE configuration includes a valid tune configuration file which will set this correctly.\n'
> >>
> >>     # Check TARGET_ARCH is set correctly
> >> -    if data.getVar('TARGE_ARCH', e.data, False) == '${TUNE_ARCH}':
> >> +    if data.getVar('TARGET_ARCH', e.data, False) == '${TUNE_ARCH}':
> >>         messages = messages + 'TARGET_ARCH is being overwritten, likely by your MACHINE configuration files.\nPlease use a valid tune configuration file which should set this correctly automatically\nand avoid setting this in the machine configuration. See the OE-Core mailing list for more information.\n'
> >>
> >>     # Check TARGET_OS is set
> >
> > After fixing this I see the following:
> >
> > ERROR:  Poky's config sanity checker detected a potential misconfiguration.
> >    Either fix the cause of this error or at your own risk disable the
> > checker (see sanity.conf).
> >    Following is the list of potential problems / advisories:
> >
> >    TARGET_ARCH is being overwritten, likely by your MACHINE
> > configuration files.
> > Please use a valid tune configuration file which should set this
> > correctly automatically
> > and avoid setting this in the machine configuration. See the OE-Core
> > mailing list for more information.
> >
> > ERROR: Execution of event handler 'check_sanity_eventhandler' failed

I've been meaning to check OECore to ensure this isn't going to cause
failures before adding the patch. I then forgot I needed to do this,
sorry :/. What I don't want to do is merge something which breaks things
for everyone...

Cheers,

Richard




