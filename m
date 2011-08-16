Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QtHsD-0006p9-GY
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 13:31:58 +0200
Received: by qyk9 with SMTP id 9so4106014qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 04:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=IPy8DFhimZOwYlDUTo8jhPxqXvBeKQ8kNA8TA/2xjr8=;
	b=uFuRR9yko9uQbxkTiS/vMmrYMlGAwy9DVENYI1EyhtRUCXsL16SvoNhhfSe+LhDwQg
	Qep/nDuK11heezeC+09CY5dOr6/StcnQDy+kYoVGSS7hHlnqE5sPUacxrqAenxfx77TP
	/EZKf1CmIxoFmCjBHBILdHlv/U/4wUZ34eMA8=
MIME-Version: 1.0
Received: by 10.229.133.141 with SMTP id f13mr3330399qct.135.1313494039128;
	Tue, 16 Aug 2011 04:27:19 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Tue, 16 Aug 2011 04:27:19 -0700 (PDT)
In-Reply-To: <20110816105907.GC10195@jama.jama.net>
References: <CAGiJk9euxaWGh_=hpspcLH0DtDSAejHZvj_HKLfKrcuvBHn6xQ@mail.gmail.com>
	<20110816105907.GC10195@jama.jama.net>
Date: Tue, 16 Aug 2011 13:27:19 +0200
Message-ID: <CAGiJk9cbjMNPMoCuWQhbKHPS6-o27PTG3ji=PJ3VyAvNWZU6Rw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error building any X11 image: "Nothing PROVIDES 'libxcb-native'"
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
X-List-Received-Date: Tue, 16 Aug 2011 11:31:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/8/16 Martin Jansa <martin.jansa@gmail.com>:
> On Tue, Aug 16, 2011 at 12:50:51PM +0200, Samuel Stirtzel wrote:
>> Hi,
>> recently all X11 images fail to build for me.
>>
>> The following error shows up (this is from core-image-sato):
>> -
>> ERROR: Nothing PROVIDES 'libxcb-native' (but
>> virtual:native:/var/oe-core/setup-scripts/sources/meta-openembedded/meta=
-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
>> DEPENDS on or otherwise requires it)
>> ...
>> Missing or unbuildable dependency chain was: ['core-image-sato',
>> 'task-core-apps-console', 'xf86-video-fbdev', 'xserver-xorg',
>> 'font-util-native', 'mkfontdir-native', 'virtual/libx11-native',
>> 'libxcb-native']
>> -
>> Looks like the DEPENDS are "wrong" and it should refer to libxcb
>> (/var/oe-core/setup-scripts/sources/openembedded-core/meta/recipes-graph=
ics/xcb/libxcb_1.7.bb)
>> instead of libxcb-native (which is not known by bitbake), but i can't
>> find the commit which changed this DEPENDS.
>>
>> After all I can't find any file that has this DEPENDS, "grep -r
>> libxcb-native *" in my source direcory showed up nothing.
>
> for some reason
> http://git.openembedded.org/cgit.cgi/meta-openembedded/commit/?id=3Dceb4a=
1deaabe81e0acaf9dd179d08736f598203e
> is missing .bbappend part..
>
> but you can apply this patch to oe-core instead..
> http://patches.openembedded.org/patch/9871/
>
> having libxcb-native directly in oe-core will help recipes-graphics
> maintainer to copy new libx11 from meta-oe to oe-core.
>
> Regards,
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Ok thanks now everything builds again.


Regards
Samuel


