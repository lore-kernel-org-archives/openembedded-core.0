Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0A27169F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 18:27:25 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id dc16so3808219qab.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 10:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Fa3CZ0JiXhW/xqVgsN/D1Rmj9NO7KQyY96/nzMhFIUk=;
	b=BK/8CXuVKl38eyKkOzcjZTHpeC7/eJI/yL2uGTtMpT50ebKmjp9uT4123TUESrHvXg
	wJbFzoH0K6Frr1zF4/Gr5KZoNMn3RyA970hHFCMXrCH03UW8JaTfzlfv49TxZF85AvjW
	us8UXKxBYg8WQM5IVQfv0bZ7/dbWbckyydY0K9nFswKijv4WlSZw4TIc6UYvKvoH4xdx
	9HRtqvQtJSOI+zCxYq9rqpn566xz2fcxVK08+wxEsoGVijs5pYpGiyWJUKil74q6bx2D
	+nTpli3Je+qpLxqN62xR2qFrE8Lv6ZkPatU0cOZvN4Y4yJiKTn9AWvhbtA3SX44Xzq/D
	Gqgw==
X-Gm-Message-State: ALoCoQlvlYZhO9mn2rmUVR8PGje2OlLV1WI8T4p3BHVPHCXlHZgk35vHE/R9jg4O+bCyEJjxaOyq
X-Received: by 10.140.39.167 with SMTP id v36mr6661313qgv.77.1420655245750;
	Wed, 07 Jan 2015 10:27:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 7 Jan 2015 10:27:04 -0800 (PST)
In-Reply-To: <4bedbe90e0589179b7c6010818a63596a9502671.1418337489.git.alejandro.hernandez@linux.intel.com>
References: <cover.1418337489.git.alejandro.hernandez@linux.intel.com>
	<4bedbe90e0589179b7c6010818a63596a9502671.1418337489.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 18:27:04 +0000
Message-ID: <CAJTo0LZ+j_=yrHQNAWUkjYyvg9P5BZFLZ-4YhPDLHgnqFBtJ-w@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA test for expanded ${D}
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
X-List-Received-Date: Wed, 07 Jan 2015 18:27:28 -0000
Content-Type: multipart/alternative; boundary=001a11c12dd2458a34050c1413e8

--001a11c12dd2458a34050c1413e8
Content-Type: text/plain; charset=UTF-8

Hi Alejandro,

Looks good, but some small points:

On 11 December 2014 at 22:40, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> -            version-going-backwards \
> +            version-going-backwards expanded_d \
>
+QAPATHTEST[expanded_d] = "package_qa_check_expanded_d"
>

Rename this to expanded-d for consistency with the other symbols that use -
instead of _.


> +            # Variables are actually var_${PN}
>

No need to document idioms, remove this comment.


> +                        messages["expanded_d"] = "FILES should not
> contain the ${D} variable as it references the local build directory not
> the target filesystem, best solution is to remove the ${D} reference"
>

This doesn't name the package which makes it tricky to find in large builds.

Ross

--001a11c12dd2458a34050c1413e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alejandro,<div><br></div><div>Looks good, but some smal=
l points:</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 11 December 2014 at 22:40, Alejandro Hernandez <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejand=
ro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">-=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version-going-backwards \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version-going-backwards expanded=
_d \<br></blockquote><div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex">+QAPATHTEST[expanded_d] =3D &quo=
t;package_qa_check_expanded_d&quot;<br></blockquote></div><div><br></div><d=
iv>Rename this to expanded-d for consistency with the other symbols that us=
e - instead of _.</div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-co=
lor:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Variables are actually var_${PN}<br></blo=
ckquote><div><br></div><div>No need to document idioms, remove this comment=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 messages[&quot;expande=
d_d&quot;] =3D &quot;FILES should not contain the ${D} variable as it refer=
ences the local build directory not the target filesystem, best solution is=
 to remove the ${D} reference&quot;<br></blockquote><div><br></div><div>Thi=
s doesn&#39;t name the package which makes it tricky to find in large build=
s.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a11c12dd2458a34050c1413e8--
