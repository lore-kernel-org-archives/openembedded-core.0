Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5FC7C6F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 10:51:55 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id d24so7167511ljc.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 02:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W7aGIpyYIgy6x4vqVtlBn8yl1u9vAiKP+7XFduo2pUE=;
	b=P6ohiCf45vuw08F0DU5qKlpKSKkRTZ44jjUpQjN9cZ0UMZFZp2/zK5Do4dP5Qn8nLX
	f53VyDvQ5+UW8PYX/MGuv+OFPXwGZDqgn2s1B3mUxtcVwMC9Vi/oZhrr12+q4B2xhlWa
	S+1YvIXzzErnLL8Q8vuMrBZW8Z6Y/VNy4rtoJL4eVmUJL3YnT8X8D5GZ9Y4/0vDbHDE+
	3JyxoTc/6ONShKdn54tnAMyyrndJEsxqYbSiPuGIldWNqbvzovIU+QRZwhauV6Hy0u01
	JJyl1ejBUiwLRseppSeCOTcIZApXMOgCXF4Vd3xlngevAllozmrsfmoV3EbwmnACj/LH
	QEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W7aGIpyYIgy6x4vqVtlBn8yl1u9vAiKP+7XFduo2pUE=;
	b=sIxxfIuP5UZ1vNv5tJXGoeN/e3OnxxLeaQ09zzsbVhOHEntBXnUDCDXXm8kCYXaI6J
	mLYEHrAfO47EOAgDbGNcm/Tf+UUAMHi1BbiDk/HTKtCMAPPDwRlTwjtWzUoss6CWLhPO
	MH16o9p86dJlX9TP8IIu/dB0hBzfqtpVzJDCIwVfwKb0GUCtavU0iO2d99o3xJ3UUc5K
	g/lhgWPeo7fVFrExsg9uQTkOD7UDm8t/ximeXSG0QXiXiVYO7Gzxywt1K8vjlN7ttuVb
	4gbnPnJ1zJQTjJfJjujmZys5vo0MZCaEfGz3tjLRjqIvk++3+8iz6xEtxb8U6MxapRBP
	lw9g==
X-Gm-Message-State: APjAAAVue3SARmTqMWrnfuNMjosMp0WKyEhOYIug0jtZi7GUL7EdIG7f
	Rn7MM4dvM/6YINbYsOSQqG91wzcfYwXm2AaYtB8=
X-Google-Smtp-Source: APXvYqz75We5ttx8Zziivjr1BCtBv9sAR36BthpoOrr0yuvWHolmycalTfHXCLhOklYCrdVkNI2YsaCnkPwEMuBQmNE=
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr8810785ljj.69.1551783115470; 
	Tue, 05 Mar 2019 02:51:55 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_1GLgMMBysaCD0GDiPSmJr6jEqVptzX6+DQmU7ZBOigMA@mail.gmail.com>
	<d104283b569d34efec7502fe4ade89c34f2ba3c9.camel@linuxfoundation.org>
	<CAPybu_0YHNMucF1LPdYNRAWdBChAfZHpb1B-PdDRC2enGmGsSw@mail.gmail.com>
	<69ee81d9db563ccf8d66ad9b20203fdfb827f2fd.camel@linuxfoundation.org>
In-Reply-To: <69ee81d9db563ccf8d66ad9b20203fdfb827f2fd.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 5 Mar 2019 11:51:38 +0100
Message-ID: <CAPybu_2xu3fh-f46hTYtPH=fHwMSRBMS=w-XgGUemmcBTDinYA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Daniel Gomez <daniel@qtec.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Two recipes providing the same .so... How it should not be done :)
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
X-List-Received-Date: Tue, 05 Mar 2019 10:51:55 -0000
Content-Type: text/plain; charset="UTF-8"

Epoch is set to 5, so that should not be the issue

PV = "${L4T_RELEASE}"
PE = "5"

Thanks

On Tue, Mar 5, 2019 at 10:37 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-03-05 at 09:27 +0100, Ricardo Ribalda Delgado wrote:
> > Hi Richard,
> >
> > Thanks for your reply!
> >
> > I tried with the following:
> >
> > INSANE_SKIP_${PN} = "already-stripped"
> > INSANE_SKIP_libegl-tegra = "ldflags dev-so"
> > INSANE_SKIP_libgles1-tegra = "ldflags dev-so"
> > INSANE_SKIP_libgles2-tegra = "ldflags"
> > INSANE_SKIP_libgl-tegra = "ldflags dev-so textrel"
> >
> > RREPLACES_libgl-tegra = "libgl-mesa"
> > RREPLACES_libegl-tegra = "libegl-mesa"
> > RREPLACES_libgles1-tegra = "libgles1-mesa"
> > RREPLACES_libgles2-tegra = "libgles2-mesa"
> >
> > RCONFLICTS_libgl-tegra = "libgl-mesa"
> > RCONFLICTS_libegl-tegra = "libegl-mesa"
> > RCONFLICTS_libgles1-tegra = "libgles1-mesa"
> > RCONFLICTS_libgles2-tegra = "libgles2-mesa"
> >
> > RPROVIDES_libgl-tegra += "gl-proprietary libgl libgl-mesa"
> > RPROVIDES_libegl-tegra += "libegl libegl-mesa"
> > RPROVIDES_libgles2-tegra += "libgles2 libgles2-tegra"
> > RPROVIDES_libgles1-tegra += "libgles1 libgles1-tegra"
> >
> > But then do_rootfs fails:
> >
> > The following packages have unmet dependencies:
> >  mesa-demos : Depends: libegl-mesa (>= 18.3.4+git0+b26488dead) but it
> > is not going to be installed
> >               Depends: libgl-mesa (>= 18.3.4+git0+b26488dead) but it
> > is not going to be installed
> >  qv4l2 : Depends: libgl-mesa (>= 18.3.4+git0+b26488dead) but it is
> > not
> > going to be installed
> >          Depends: qtbase (>= 5.11.1+git0+74305ba470) but it is not
> > going to be installed
> >
> >
> > I am forcing the installation of libgl-tegra by making:
> >
> > XSERVER += "gl-proprietary"
> >
> > What am I doing wrong :)
>
> I'd forgotten that things have hard version requirements in some of
> these dependencies :(
>
> You'd probably need to make sure your recipe has a version (or epoch,
> PE may be easier) higher than the original recipe? I think that is what
> the package manager is saying in the error above.
>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda

