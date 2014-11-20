Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 55A3665C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 20:43:08 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id a108so2644635qge.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 12:43:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7sECFZ0FfL/g/4ImfpcDDhbZ7HLPSMFxDj6YboA8ACk=;
	b=ImfTXvHu5cY5VMxgRFr23QvlxhyHPCraOQo4D4Te1gk93gx5rhLxKvAzmYC9sm93y+
	rsPiOeaCPTik3V9Qs1psFA1TycaZ70IID1sDLxKVz+PtCwq1Lh+5xyuTef9NGSWiLVVj
	vQnOPprp84rgAbUnAUfQF0YcdIRVfHvpEHbaxDJ7vNXe8XX3zxO8RTSlDkRC1ivGUpiy
	C+uj4wNE4QW5IByxrz9LXIIKd6iPy4M8A3Vb9S9bLOTIobxkwDCya1S53efgfMfsehZ6
	JQ6wbfctf5e+z5l2wZsnTTuK0H38//4/mmlUraDPnIxGIFKsuuJfQ1ovJi4AYG0fwWBr
	J0Wg==
X-Gm-Message-State: ALoCoQmIsPwXkCSKkHg9y31yGBERIb4WBTBY3KIiG4q7zeZgiJgFTUPfCG8aX/ybJpryiGQK1VjG
X-Received: by 10.229.53.133 with SMTP id m5mr610992qcg.28.1416516189429; Thu,
	20 Nov 2014 12:43:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 20 Nov 2014 12:42:49 -0800 (PST)
In-Reply-To: <cover.1415953970.git.Qi.Chen@windriver.com>
References: <cover.1415953970.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Nov 2014 20:42:49 +0000
Message-ID: <CAJTo0LbyscwOWnw9Ni+4CK4xdGT55wjwUUcGCWhqPXh6u2x3Lg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Use ALTERNATIVES to manage 'nologin'
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
X-List-Received-Date: Thu, 20 Nov 2014 20:43:14 -0000
Content-Type: multipart/alternative; boundary=001a1133da324a37e1050850602a

--001a1133da324a37e1050850602a
Content-Type: text/plain; charset=UTF-8

On 14 November 2014 08:35, Chen Qi <Qi.Chen@windriver.com> wrote:

> Chen Qi (2):
>   util-linux: use ALTERNATIVE mechanism to manage 'nologin'
>   shadow: use ALTERNATIVE to manage 'nologin'
>

util-linux has been changed since this was sent, can you rebase please?

Cheers,
Ross

--001a1133da324a37e1050850602a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2014 08:35, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":457" class=3D"a3s" =
style=3D"overflow:hidden">Chen Qi (2):<br>
=C2=A0 util-linux: use ALTERNATIVE mechanism to manage &#39;nologin&#39;<br=
>
=C2=A0 shadow: use ALTERNATIVE to manage &#39;nologin&#39;</div></blockquot=
e></div><br>util-linux has been changed since this was sent, can you rebase=
 please?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--001a1133da324a37e1050850602a--
