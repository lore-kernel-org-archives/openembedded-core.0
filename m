Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4968B7828D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 12:51:54 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id u19so74330219qta.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B92d7lHJnAfaPvMhCou9rUYyEVd/gYzdfJmikdDZbBc=;
	b=VG0iDYf85wwBH7Hg3Hg5WsvUz033Pb9M1jAcfxxFqBJ4z80l7Rd+v61FYym8j3B7qb
	L7EffTBBZu044SnjKOePYCNo7fM6dVQ+XgVaKd5BuKboNJcC84onohtB2+3JWYAKnd0w
	caIYbmsi8ECmsUg5aXNYWba2aI6ZiUnFYYObOatZJEXxC/iABGxkEBsaAw+BMtm5VhIO
	FQ3Y7hOV1eFWNEaorRHu7YYrAVNF7hJ4kDGNsT4VSgktc5WlfSWp9eu1r2588o+gkPn+
	uIxOwGDMve3/xVaNGlLoD9BASu7VkUWSt2gakfkwh0xYOfNqchNbpXtGhvI4lD8uE64S
	BGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B92d7lHJnAfaPvMhCou9rUYyEVd/gYzdfJmikdDZbBc=;
	b=d/vD7T0eE4hyMTAIwtJbaUxtP1Ma3X/4AF/B3YtOUFhtwUNA1c2jI3YiLlrsKVYw5Y
	/im5TITwdu2DXrsDe1rnLjaV5z+yIqMU88V1IIRb0Y3921kFz6+WHJhsAgeNxY2T5hXs
	5ZWaYD++DurDxztKjSu711eil4ccUOdJKevb6zIy4oN8GGTtHTM5b7dCkAAt7+QJ+8k8
	fm56bKmxGOdqPdjIBV5c4bhDsx4Jq6JFpb4pFp0fFAfYWHsKlHs+m3ptLjQbsWA9XGSk
	j/77WBmTercXUaembI6U3LqdDEsprwiaa43mHJ66VzRCSsbQUa9w2dZsCewcW0EBXloK
	YFhA==
X-Gm-Message-State: AKS2vOxA2HEZGQ65tWAJV0i9oYtZHmhxEoRzOea3ysetipE8ZOu7+IbR
	sdjS6WdC2k7EjWin9XsYduvNam8xtm0U
X-Received: by 10.55.221.24 with SMTP id n24mr28887631qki.46.1497012715979;
	Fri, 09 Jun 2017 05:51:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 9 Jun 2017 05:51:35 -0700 (PDT)
In-Reply-To: <20170608204022.427-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170608204022.427-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 13:51:35 +0100
Message-ID: <CAJTo0LZHv-h9Kna7o1HXc8n+XaxTbYtW_=+vbFOd79KgKD=-tA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] context: allow test execution with buildhistory unless version-going-backwards is present
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
X-List-Received-Date: Fri, 09 Jun 2017 12:51:55 -0000
Content-Type: multipart/alternative; boundary="001a11466c482939260551866fad"

--001a11466c482939260551866fad
Content-Type: text/plain; charset="UTF-8"

On 8 June 2017 at 21:40, <leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> -        if "buildhistory.bbclass" in self.tc.td["BBINCLUDED"]:
> +        # buildhistory introduce QA 'version-going-backwards' errors so
> stop if the latter are enabled
> +        if "buildhistory.bbclass" in self.tc.td["BBINCLUDED"] and
> 'version-going-backwards' in self.tc.td['ERROR_QA']:
>

Would it be possible instead to remove version-going-backwards from
ERROR_QA?

Ross

--001a11466c482939260551866fad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 June 2017 at 21:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:leonardo.=
sandoval.gonzalez@linux.intel.com" target=3D"_blank">leonardo.sandoval.gonz=
alez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":1zq" class=3D"a3s aXjCH m15c8970c82c744b9">-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if &quot;buildhistory.bbclass&quot; in <a href=3D"http://self.tc=
.td" rel=3D"noreferrer" target=3D"_blank">self.tc.td</a>[&quot;BBINCLUDED&q=
uot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # buildhistory introduce QA &#39;version-going=
-backwards&#39; errors so stop if the latter are enabled<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;buildhistory.bbclass&quot; in <a href=
=3D"http://self.tc.td" rel=3D"noreferrer" target=3D"_blank">self.tc.td</a>[=
&quot;BBINCLUDED&quot;] and &#39;version-going-backwards&#39; in <a href=3D=
"http://self.tc.td" rel=3D"noreferrer" target=3D"_blank">self.tc.td</a>[&#3=
9;ERROR_QA&#39;]:<br></div></blockquote></div><br>Would it be possible inst=
ead to remove version-going-backwards from ERROR_QA?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11466c482939260551866fad--
