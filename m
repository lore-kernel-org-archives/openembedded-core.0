Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8EA6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:30:37 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id uo1so4872856pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 07:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=sP5+FKZqo/gSIDQEdN+UquBHQSvDQ1Rzv4pjJaHoVZg=;
	b=Odbn6LwHCXEOjz4+EsKxDdGGf45aRtdTAK+9AjrP9J/yRj+z6FaoWm61HAJGwbCp4p
	rpFSmKG2K1HLz0gM4L9HWKDoLR5s4Wsac+WE4olf3xgXR520e49KgamMjsbjDlEf913B
	zduzIC1rbzcTxJ2G2lVywEkCk9q+pGPLJHoT9TC5sqy/7sQdIy9UEcYI0ydsbVnSUSRh
	naeAv7NQcFKUGWSgLPx7t7Gjw3bZKZg95NLZOvTUv4hxc9JoNh8nC3ksllelCd7fpe8V
	vOFV6SFzpJynNlxrUiDHtwi1e7Ril2ryf3PMr0t2QLBd7E0TZbTXJmeDm3T4S5Wfotij
	04Jg==
X-Received: by 10.68.110.227 with SMTP id id3mr23864030pbb.106.1372689038254; 
	Mon, 01 Jul 2013 07:30:38 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	bg3sm22539570pbb.44.2013.07.01.07.30.36 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 07:30:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAKpQ200meOQcEu+vwbWBQpVC+FtvJw1uXLVV2qufvLud5aEvLg@mail.gmail.com>
Date: Mon, 1 Jul 2013 07:30:35 -0700
Message-Id: <C234ACE8-19BD-4AA8-A45C-C2F712BFA4ED@gmail.com>
References: <CAKpQ200meOQcEu+vwbWBQpVC+FtvJw1uXLVV2qufvLud5aEvLg@mail.gmail.com>
To: =?iso-8859-1?Q?V=EDctor_MV?= <v.mayoralv@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: apr: Add EXTRA_OECONF += "apr_cv_mutex_recursive=yes"
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
X-List-Received-Date: Mon, 01 Jul 2013 14:30:37 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8C077776-CDE4-4525-8550-1E8D6F9A5F28"

--Apple-Mail=_8C077776-CDE4-4525-8550-1E8D6F9A5F28
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Jul 1, 2013, at 6:12 AM, V=EDctor MV <v.mayoralv@gmail.com> wrote:

> Working with the meta-ros project we detected that the ROS nodes =
didn't launch properly the reason was that by default =
apr_cv_mutex_recursive in apr is set to no and this leads to the =
APRENOTIMPL return value of apr_thread_mutex_create in thread_mutex.c =
when APR_THREAD_MUTEX_NESTED is requested via flags. Added EXTRA_OECONF =
+=3D "apr_cv_mutex_recursive=3Dyes" to =
sources/openembedded-core/meta/recipes-support/apr/apr_1.4.6.bb to fix =
this issue.

thanks follow =
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
to prepate the patch for review and instead of putting it in =
EXTRA_OECONF add it to CACHED_CONFIGUREVARS


>=20
> Regards,
>=20
> V=EDctor.
>=20
> =
<0001-Patch-to-apr_1.4.6.bb-to-make-rosnodes-work.patch>__________________=
_____________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_8C077776-CDE4-4525-8550-1E8D6F9A5F28
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Jul 1, 2013, at 6:12 AM, V=EDctor MV &lt;<a =
href=3D"mailto:v.mayoralv@gmail.com">v.mayoralv@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div dir=3D"ltr"><div style=3D"">Working with the meta-ros =
project we detected that the ROS nodes didn't launch properly the reason =
was that by default apr_cv_mutex_recursive in apr is set to no and this =
leads to the APRENOTIMPL return value of apr_thread_mutex_create in =
thread_mutex.c when APR_THREAD_MUTEX_NESTED is requested via flags. =
Added EXTRA_OECONF +=3D "apr_cv_mutex_recursive=3Dyes" to =
sources/openembedded-core/meta/recipes-support/apr/<a =
href=3D"http://apr_1.4.6.bb/">apr_1.4.6.bb</a> to fix this =
issue.</div></div></blockquote><div><br></div><div>thanks follow&nbsp;<a =
href=3D"http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbe=
dded">http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedd=
ed</a></div><div>to prepate the patch for review and instead of putting =
it in EXTRA_OECONF add it to =
CACHED_CONFIGUREVARS</div><div><br></div><br><blockquote =
type=3D"cite"><div dir=3D"ltr">
<div style=3D""><br></div><div style=3D"">Regards,</div><div =
style=3D""><br></div><div style=3D"">V=EDctor.</div><div><br></div></div>
=
<span>&lt;0001-Patch-to-apr_1.4.6.bb-to-make-rosnodes-work.patch&gt;</span=
>_______________________________________________<br>Openembedded-core =
mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core=
@lists.openembedded.org</a><br>http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core<br></blockquote></div><br></body></html>=

--Apple-Mail=_8C077776-CDE4-4525-8550-1E8D6F9A5F28--
