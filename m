Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UPbg4-0000ts-HP
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:45:52 +0200
Received: by mail-ob0-f181.google.com with SMTP id wo10so2711578obc.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=q7qWMQ09LH3bGYTEjeuAtPVCv1Xex+hAYs8fsVSrE/k=;
	b=z07nHNmnJnkrzYck17SIwmrPUV7PPEXFnPDmGVDh8jdNp8S8iGcDsNaR089qAPXitv
	IIWDyhjFZmncBcDES1UYA56rJ4S48/Uy4myDGSgmiV0fKj3VPioz4eRa6PL2gmjmh1/n
	mczT8Yn2pR4SvF2Rt+Lk1WZZBAQ66iouw6onJOFFAfqhoydnyO27zvryW/03sBYJzLqB
	gLtkFPnxvz59Z9Y7zl0GFTVXqhtDGfgMKa5Eb/QiiTuoCtLEtZjcM3NzEjN3luMN2+UH
	TQ4Oqh/NO2JYKc1BErb2S89dLT6w3bC/kdhzhim0SlSsrZjUSQcLV9JgfcGp7+nJaNFs
	MXMA==
MIME-Version: 1.0
X-Received: by 10.60.93.7 with SMTP id cq7mr19037546oeb.40.1365524907688; Tue,
	09 Apr 2013 09:28:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 9 Apr 2013 09:28:27 -0700 (PDT)
In-Reply-To: <1365520076.12407.88.camel@ted>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<1365510909.12407.79.camel@ted>
	<CAP9ODKqEJCS56UaKT3M1cPpA-escn5f7d_kEBL2kasnLYN2avQ@mail.gmail.com>
	<3528EE5E-C07B-4EBC-83E2-B425A1DD5F22@dominion.thruhere.net>
	<BD05C246-767C-4B72-A7B7-0776A5E98355@dominion.thruhere.net>
	<1365520076.12407.88.camel@ted>
Date: Tue, 9 Apr 2013 13:28:27 -0300
X-Google-Sender-Auth: Ue__ZJX4nsBtwGMZel4EUOx8QXw
Message-ID: <CAP9ODKq+HknKCOtqeC-rVO=SnqqM9pkMr2ymKXELXAO_N-mNVg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 16:45:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 12:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-04-09 at 16:44 +0200, Koen Kooi wrote:
>> Op 9 apr. 2013, om 16:41 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
>>
>> >
>> > Op 9 apr. 2013, om 16:36 heeft Otavio Salvador <otavio@ossystems.com.br> het volgende geschreven:
>> >
>> >> On Tue, Apr 9, 2013 at 9:35 AM, Richard Purdie
>> >> <richard.purdie@linuxfoundation.org> wrote:
>> >>> On Mon, 2013-04-08 at 19:29 +0300, Radu Moisan wrote:
>> >>>> Along with v182 upgrade udevd was moved to ${base_libdir}
>> >>>> making scripts like init-live.sh to fail in finding udevd
>> >>>>
>> >>>> Fixes [Yocto #4046]
>> >>>>
>> >>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> >>>> ---
>> >>>> meta/recipes-core/udev/udev.inc    |    3 ++-
>> >>>> meta/recipes-core/udev/udev_182.bb |    2 +-
>> >>>> 2 files changed, 3 insertions(+), 2 deletions(-)
>> >>>
>> >>> We needed a decision on this. I've rewritten the commit message and
>> >>> merged it. Most of the feedback was about the commit message, not the
>> >>> patch itself. There were also no better proposals for how we could
>> >>> actually fix the bugs we were seeing.
>> >>
>> >> If I read the thread right, it had two NACK's. So it wasn't a cosmetic
>> >> commit log issue.
>> >
>> > 4 replies to the patch:
>> >
>> > 1) me asking about the commit log
>> > 2) me NACK'ing the patch
>
> Without any constructive way of fixing the issues. As I've said,
> "fixing" the other scripts does not work. Nobody has proposed any
> reasonable realistic way of unbreaking the multilib support which worked
> prior to the udev upgrade. Nobody has actually taken the time to even
> understand what is breaking as far as I can tell.
>
>> > 3) Otavio NACK'ing the ptch
>
> Again, not constructively. People saying "no" just because they dislike
> it doesn't really work.

It wasn't the case and I even pointed out the systemd-udevd problem
which has not been fixed so it was not "no" but a justified NACK. If
our NACK'ing is ignored what is the  matter of people using their time
to comment in something?

>> > 4) RP mentioning other discussions
>>
>> And by the way, does anyone actually bother testing patches to important infrastructure like udev?
>>
>> [koen@rrMBP udev]$ git log --oneline -1
>> a866e1e udev: Move udevd back to /sbin
>>
>> [koen@rrMBP udev]$ git grep /lib/udev/udevd
>> udev/init:[ -x /lib/udev/udevd ] || exit 1
>> udev/init:    /lib/udev/udevd -d
>> udev/udev-cache:[ -x /lib/udev/udevd ] || exit 1
>>
>> So the patch broke the sysvinit script, congratulations!
>
> Patch screw up :(. This will get fixed shortly, sorry about that.

It seems the right fix, for now, as I commented in the bug, is to use
/lib hardcoded.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


