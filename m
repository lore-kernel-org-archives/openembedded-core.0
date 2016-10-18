Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B9F877198E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 16:39:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Oct 2016 09:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,362,1473145200"; 
	d="scan'208,217";a="774151460"
Received: from jlock-mobl1.ld.intel.com ([10.103.239.41])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2016 09:39:36 -0700
Message-ID: <1476808775.14120.7.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>, 
	"Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Oct 2016 17:39:35 +0100
In-Reply-To: <ad1b1d7c-9789-7560-283f-bdd6f36e5362@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<5458be631bd0e452a6b05b09e9b86d6fbf567eeb.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LZCuuR-aacRaj-akM8dLWrMtcCP2yH46H7U1tkp5wZVjQ@mail.gmail.com>
	<ad1b1d7c-9789-7560-283f-bdd6f36e5362@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] selftest: skip some devtool tests when distro is poky-tiny due to missing libx11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2016 16:39:36 -0000
Content-Type: multipart/alternative; boundary="=-CcXkrkmsiNQYd5UoLSla"

--=-CcXkrkmsiNQYd5UoLSla
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-10-17 at 10:19 -0500, Leonardo Sandoval wrote:
> 
>     
> 
>     
>     
> 
>     On 10/17/2016 06:42 AM, Burton, Ross
>       wrote:
> 
>     
> 
> >       
> >         
> > 
> > > >           On 14 October 2016 at 17:40, <leonardo.sandoval.gonzalez@
linux.intel.com>
> >             wrote:
> > 
> > >                  
> > >                  def test_devtool_add_fetch_git(self):
> > > 
> > >                 -        # Fetch source
> > > 
> > >                 +        if self.distro == 'poky-tiny':
> > > 
> > >                 +            self.skipTest('libmatchbox2 is not
> > > > > >                 buildable with poky-tiny because it requires a
libx11
> > >                 provider')
> > > 
> > > > > >                          tempdir =
tempfile.mkdtemp(prefix='devtoolqa')
> > > 
> > >                          self.track_for_cleanup(tempdir)
> > > 
> > > > > >                          url =
'git://git.yoctoproject.org/libmatchbox'
> > > 
> > >             
> >           
> > 
> >           
> > 
> >           Changing the test to use a recipe that doesn't require a
> > > >           distro feature that many distros disable seems like a
more
> >           sustainable fix.
> > 
> >         
> > 
> >         
> > 
> >       
> > 
>     Which recipe do you think would be more generic?

Something in the minimal image which doesn't rely on DISTRO_FEATURES
which aren't in the default distro.

Thanks,

Joshua

--=-CcXkrkmsiNQYd5UoLSla
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body><div>On Mon, 2016-10-17 at 10:19 -0500, Leonardo Sandoval wrote:</div><blockquote type="cite">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/17/2016 06:42 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote cite="mid:CAJTo0LZCuuR-aacRaj-akM8dLWrMtcCP2yH46H7U1tkp5wZVjQ@mail.gmail.com" type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 14 October 2016 at 17:40, <span dir="ltr">&lt;<a moz-do-not-send="true" href="mailto:leonardo.sandoval.gonzalez@linux.intel.com" target="_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote type="cite">
              <div id=":1ch" class="a3s aXjCH m157c41168b5229f1">&nbsp; &nbsp;
                &nbsp;def test_devtool_add_fetch_git(<wbr>self):<br>
                -&nbsp; &nbsp; &nbsp; &nbsp; # Fetch source<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; if self.distro == 'poky-tiny':<br>
                +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.skipTest('libmatchbox2 is not
                buildable with poky-tiny because it requires a libx11
                provider')<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tempdir = tempfile.mkdtemp(prefix='<wbr>devtoolqa')<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.track_for_cleanup(<wbr>tempdir)<br>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;url = 'git://<a moz-do-not-send="true" href="http://git.yoctoproject.org/libmatchbox" rel="noreferrer" target="_blank">git.yoctoproject.org/<wbr>libmatchbox</a>'</div>
            <br></blockquote>
          </div>
          <br>
          Changing the test to use a recipe that doesn't require a
          distro feature that many distros disable seems like a more
          sustainable fix.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    Which recipe do you think would be more generic?<br></blockquote><div><br></div><div>Something in the minimal image which doesn't rely on DISTRO_FEATURES which aren't in the default distro.</div><div><br></div><div>Thanks,</div><div><br></div><div>Joshua</div></body></html>

--=-CcXkrkmsiNQYd5UoLSla--
