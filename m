Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id C8B607F26A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 08:32:55 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id j21so37471171uap.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WA3uz9zNKZdPAI/Bn3I+Izf18f7dMamRLNzbdrqpj+8=;
	b=CiNg/8IUvdLOr+xAK+rzNMIByz42TzmEBPmlaTox7F52eODfsiQ6BiBFcJrZ8pwlLN
	CgOm7kPHfF4cIHMMAlUDM4G/aszrtD30lOkFySyEIrzzumXqjz0pldGRklRFLBWnPzHh
	U5F5G3+GFUhm2nIUfuCQMiddGUstvL3N2XAr4ep/pC9ykPTM/N3uRX0m+VpSClyiAU3d
	bsrRS1prdAc3mMOIpfohRCt+KNy5/oCcBCF9k3ayRrk47pYpWf+2DWW0h7DUW7QLu3Vs
	x/xI4F/xxnSAfI6CHH6lyRqYHEFAfWiQSHbJiOMi1lTwqUG2BlTcQe14yQWQ4qnsQEbU
	x71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WA3uz9zNKZdPAI/Bn3I+Izf18f7dMamRLNzbdrqpj+8=;
	b=BdHq3CK2AuwFERRohVD6ukiuAHZZLrTY6YxDdMQoegYyaM1x5pZQ3OqkMvIg2qolAH
	xReNFz/ppBP4cjyiMKZWk8ENBmLueuCuYfoqhJE3LvGP77j5/5d4JavlZRr09NkA/zyc
	HihuJnH4XiJgdWhO6B91pb2STL2VXaG8HnIbV0r98RNaTc7wVud6OMwCGCKlcHunTuG4
	0sajKD7Q+CeTOZv1aDmgK+4qzFSrIw6iXZoMueZaq+cdlV3bzCEuEM10DdAOfBIgO9o+
	mLWQTnlsC38wsA1oC0a0dGtA33VUj2bGfFW35UGW6s6dcdP/L/GnfIGoWWE+i9OjIuGB
	Q0ZQ==
X-Gm-Message-State: APjAAAUpL2GWcd14IugDUo1DQenGNJDEJHmXrhshscmle1CZzmy7GXjQ
	3bSsZQfq81n8ntsGRRq4FRPXr3WO/qqrUVRuepc=
X-Google-Smtp-Source: APXvYqynBjmj6RWSorFrq+Ew/ISSCJ+G6TV7rI5IG1qh++WBhzPOPhS1Rj2/ao0DZmjR8sXe2aCXK/fNP8usO8ZFV24=
X-Received: by 2002:ab0:30ae:: with SMTP id b14mr1300153uam.22.1565339576810; 
	Fri, 09 Aug 2019 01:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <1565333257-171001-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1565333257-171001-1-git-send-email-hongzhi.song@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Aug 2019 10:32:45 +0200
Message-ID: <CANNYZj9vnr9Gx=guzr9426JqSd3w5AUSXvgzbmJ2ppC+s4TgMA@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-tools: enable manpages option for configure
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
X-List-Received-Date: Fri, 09 Aug 2019 08:32:56 -0000
Content-Type: multipart/alternative; boundary="0000000000006dc192058fab056a"

--0000000000006dc192058fab056a
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019 at 08:49, Hongzhi.Song <hongzhi.song@windriver.com>
wrote:

> If disable this option, production will prompt "No manual entry for
> lttng-help" when execute "lttng --help" series commands.
>
> Enable the option will make lttng-tools compile manpages and then
> package them into lttng-tools-doc/.
>

Enabling manpages is generally subject to 'api-documentation' DISTRO_CONFIG
option. Why make an exception here?

Alex

--0000000000006dc192058fab056a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 9 Aug 2019 at 08:49, Hongzhi.Song=
 &lt;<a href=3D"mailto:hongzhi.song@windriver.com">hongzhi.song@windriver.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">If disable this option, production will prompt=
 &quot;No manual entry for<br>
lttng-help&quot; when execute &quot;lttng --help&quot; series commands.<br>
<br>
Enable the option will make lttng-tools compile manpages and then<br>
package them into lttng-tools-doc/.<br></blockquote><div><br></div><div>Ena=
bling manpages is generally subject to &#39;api-documentation&#39; DISTRO_C=
ONFIG option. Why make an exception here?</div><div><br></div><div>Alex<br>=
</div></div></div>

--0000000000006dc192058fab056a--
