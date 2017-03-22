Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id B0FCE77A8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 12:02:32 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id p64so155611152qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2BnxGIgz8EkN8VTgo0pB88R4IUuDJzzuGNePYWcf0Xc=;
	b=XEIpYxRhSxnwX11jBqXB1KJDyvU6LsBPhUCYVNTjIJnagpBtD9thJph89LFLEKoKWY
	90+JnAR7abBqSGKl7OOO4Qb9cwBY1fBs03g45JC7/WEcELY+D7ONc3ZCFf/eZAp48nlo
	XbgGgto0w/JCXxmq/aEV+qwlw62+ezNVzWsGLq6iRZ2er/+CHpk76xCIKvK+dBkdZUvN
	0NcNk6OY3XsIs7SYT8W6dA2iukZmrkBxh/oysMJoj4v30bRChxbIUvX1cEP+pnmLExuq
	lKflLlf7nlEufMoNDdOeJnqad1QnKelJw/khRNc9T7jf9r6M4N/ChtT1EKHFbXdDt8N1
	v++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2BnxGIgz8EkN8VTgo0pB88R4IUuDJzzuGNePYWcf0Xc=;
	b=DQXBtsdCd3w0k1/cFCY808j+lK+ut6lRjR/X13mqqtIazcj7ihV3ImHcRB4nEtPZ+h
	IXC+5UxUxCKCoYoogtRaHlpD83661uTGkIWyXzhlx3eenY9tKRm5uarIUu5jldieRx1d
	2lMEmentb6lNodK8gRR7e4+F3Q1tfsopaZ6yWfvqQMA9PoKzaIlAOpfSw1yj3TSNlc2w
	0v95xroom0NYX2H76skwF796+O5ZItiq75yXuS5ZOSvp2ck/Y+OfL6bPbxPzvRO4YLVs
	t518FVJHGFcOPtVxGmvZA1GwYdYmpihq9idTydjrvNpZOYCi0RIRTZV43xyrg18PP5ne
	XXIg==
X-Gm-Message-State: AFeK/H0DAXed89zYMrdnkzeUaNK7PRONqeta4e4VThK0DjgqWDBW5z8awBBw0uCGBADOQ+6AkDsc7wAjfMhG2mRd
X-Received: by 10.55.20.100 with SMTP id e97mr3149078qkh.3.1490184153436; Wed,
	22 Mar 2017 05:02:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 05:02:12 -0700 (PDT)
In-Reply-To: <CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
	<CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 12:02:12 +0000
Message-ID: <CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 12:02:33 -0000
Content-Type: multipart/alternative; boundary=001a114011041db9f4054b508963

--001a114011041db9f4054b508963
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 11:57, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> So where are they supposed to be specified ? Surely not a separate distro
> .conf ? and most
> certainly not in local.conf ... I've always been unsure of where the right
> place to specify
> versions like that.
>

If it were my layer I'd have an .inc file that set all the preferred
versions where the defaults don't work, that the user would have to include
in their distro.

Ross

--001a114011041db9f4054b508963
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 11:57, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>So where are =
they supposed to be specified ? Surely not a separate distro .conf ? and mo=
st</div><div>certainly not in local.conf ... I&#39;ve always been unsure of=
 where the right place to specify=C2=A0</div><div>versions like that.</div>=
<div></div></blockquote></div><br>If it were my layer I&#39;d have an .inc =
file that set all the preferred versions where the defaults don&#39;t work,=
 that the user would have to include in their distro.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114011041db9f4054b508963--
