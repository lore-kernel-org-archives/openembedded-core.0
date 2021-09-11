Subject: Re: [PATCH] [hardknott] module.bbclass: Improve kernel module dependency detection
To: openembedded-core@lists.openembedded.org
From: "Charlie Davies" <charles.davies@whitetree.xyz>
X-Originating-Location: GB (185.217.117.68)
X-Originating-Platform: Linux Chrome 93
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 11 Sep 2021 15:30:27 -0700
References: <a02f5ca73dcb4fb2d9d8c76e6fc5f6f0001a2361.camel@linuxfoundation.org>
In-Reply-To: <a02f5ca73dcb4fb2d9d8c76e6fc5f6f0001a2361.camel@linuxfoundation.org>
Message-ID: <6234.1631399427582524608@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="UXDm9vjJTvLOILiFWwxu"

--UXDm9vjJTvLOILiFWwxu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Indeed, as you suspected, I came back to my machine to a bunch of hash mism=
atch errors so this patch is not the right way to go about this.

There definitely exists an issue and the reason I came across it was by fol=
lowing the hello-mod recipe in meta-skeleton.

KBUILD_EXTRA_SYMBOLS is passed to make and is just a list of filepath(s) to=
 the depended on module(s) Module.symvers file needed by the module which h=
as the dependency to build successfully.

I will have a think about a better solution.

Cheers,

Charlie

--UXDm9vjJTvLOILiFWwxu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Indeed, as you suspected, I came back to my machine to a bunch of hash mism=
atch errors so this patch is not the right way to go about this.<br /><br /=
>There definitely exists an issue and the reason I came across it was by fo=
llowing the hello-mod recipe in meta-skeleton.<br /><br /><span style=3D"wh=
ite-space: pre-wrap;">KBUILD_EXTRA_SYMBOLS is passed to make and is just a =
list of filepath(s) to the depended on module(s) </span><span style=3D"whit=
e-space: pre-wrap;">Module.symvers file needed by the module which has the =
dependency to build successfully.<br /><br /></span>I will have a think abo=
ut a better solution.<br /><br />Cheers,<br /><br />Charlie

--UXDm9vjJTvLOILiFWwxu--
