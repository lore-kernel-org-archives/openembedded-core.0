Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6763873FA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 21:12:28 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id k1so197199180vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 14:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=EQBmgWSsLXhFBQjDcl9W3IrcGanPyez/4Am/aPC/MtQ=;
	b=o8waZsZI/F8wNVh1ZaMtTOEtbU/nFtK5CSxWU7gpJxmTaW/z1WRcDwrC4YQeI+UFPa
	HCsHASjvXdgvLYo0qYrcdeWW/PhAF+gI1G9IETDDCwq+ONS+Q5giYlwwPnFztJgD9NTo
	G2dvnppgELBsZUpcKfq2nRNFaF6D6fy7sg5qrqr4M8GDqEu10q4b9esk/L2TpfY7/0u8
	QK0uHIhlT40r8ZaDbTvTDijn+tTJr6S0eZVQsOEvnsquPqEf6NNR4DNGs4nYvDeTEOkS
	xOXcTQx4xMTZalL5YoyYyduhVlen2XXJNE+r02aQcT52ERNtQJxL8EqTPQuHMFNmpnr6
	aqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=EQBmgWSsLXhFBQjDcl9W3IrcGanPyez/4Am/aPC/MtQ=;
	b=BeL7fzEHYgZyPuUAlfctCCRKXqQxVFocrpSNC66VspbwEKNcIaG1aXv4hdRFuZ2+s2
	F+z7eyEUlVICSR5cufd5zRFcLfASBh/LxJzwxBjceWLpTIMZDtRjdtcHP942kF8aIXl7
	FsBIUXVDaCh5jtINia7BNI03yFm4em5XeNxPrNdvHXo9GMcdg+7mjqqTM3zf/toHRTOs
	uxukAEx2T9AsAmBcDepH0LSeTflOq/RFA5a5zNND1OKKDcY9hmIiLTrU7Uo5XMGo5VaX
	JjALL1Un6gvTSz1dUjI52n+QJOWBXKlaihkybEPGAttsv/A+oMOW1CcpPwYnotKHnwAr
	9uPw==
X-Gm-Message-State: AD7BkJJXj64/DM25cS7kKLNOFTqLWW3yGsrgvOdQJcEiEg1wu94aZDyuxZtgXAZZ7D4wWC+LGrfUrkezyI2u7Q==
MIME-Version: 1.0
X-Received: by 10.31.129.211 with SMTP id c202mr1116597vkd.52.1459804349085;
	Mon, 04 Apr 2016 14:12:29 -0700 (PDT)
Received: by 10.159.35.65 with HTTP; Mon, 4 Apr 2016 14:12:28 -0700 (PDT)
In-Reply-To: <CALbNGRTvQBVetdm7ty8RQLviYijSP0GadUNUUycAepYWX8iCjw@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
	<CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
	<CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
	<CAEHkU3XvFjr8dCV48E7zvtWPDwJ1Vht=Q02MdM9C+KM0-N=s9g@mail.gmail.com>
	<CALbNGRTvQBVetdm7ty8RQLviYijSP0GadUNUUycAepYWX8iCjw@mail.gmail.com>
Date: Mon, 4 Apr 2016 23:12:28 +0200
Message-ID: <CALbNGRTBWN37Y5vfhVxChSkUSU49oGQv1x9iug-zpZ2epn--4A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Mon, 04 Apr 2016 21:12:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 4, 2016 at 10:46 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Apr 4, 2016 at 10:00 AM, Max Krummenacher <max.oss.09@gmail.com> =
wrote:
>> Hi Andreas
>>
>> I guess Richard refers to this one:
>> http://cgit.openembedded.org/openembedded-core/commit/meta/classes/packa=
ge.bbclass?h=3Dmaster-next&id=3Decb56a6ae0c870af680da03db9d39703b525fc98
>> Max
>>
Hi Max,

* your patch fixes my warnings
* with Richard's comments I reduced your patch to

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bdbe96d..64bbeb4 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -410,6 +410,13 @@ def copydebugsources(debugsrcdir, d):
         if retval:
             bb.fatal("debugsrc symlink fixup failed with exit code %s
(cmd was %s)" % (retval, cmd))

+        # cpio --no-preserve-owner does not create the destination files w=
ith
+        # owner root even when run under pseudo, chown them explicitely.
+        cmd =3D "find '%s%s' -not -uid 0 -exec chown 0:0 {} \;" %
(dvar, debugsrcdir)
+        (retval, output) =3D oe.utils.getstatusoutput(cmd)
+        if retval:
+            bb.fatal("cpio --no-preserve-owner fixup failed with exit
code %s (cmd was %s)" % (retval, cmd))
+
         # The copy by cpio may have resulted in some empty
directories!  Remove these
         cmd =3D "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
         (retval, output) =3D oe.utils.getstatusoutput(cmd)

and incremental build logs still look quiet (need a scratch build to
be sure). Could you try if that one works for you?

Somehow cpio turns suspicious: my fedora 23 ships 2.11 which is 6
years old. Have checked cpio's (git) logs but did not find something
(there was a matching bugfix 2.10 -> 2.11 - ....)

So how about a survey:

* Which version of cpio does your build host distribution ship
* do you see floods of host contamination warnings for shipped source files=
?

Andreas

