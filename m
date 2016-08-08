Return-Path: <jacob.kroon@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFCAB77175
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 06:28:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so13480384wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2016 23:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=z2Lukdt7oy8wx5fCKM3AWfjiKKTjLCfFaoZmBkxOCXc=;
	b=UL0WDd9ez+FWIY6+xRsQ9hChuyo0XWEYOXwjF9V//pxqjLdkQ1AhbB2yD3gk8M5twJ
	Q74UqJsQvR0opw+/xv2FLODe4DjyjcrurVuEgc9mgWhDkRIVdAx+BmODBissZB5A4WB+
	SbIUD+5SqKjlQ8xucaSgpss46PfeidUI+gvvsDxWpgXDyZ+8RnqxEzmYqydy+wvbp4hJ
	9ejYA4Lr2t/itBFlECwSVSu9Mc40J4RJxCms1Cf5emAH6NDC3DqhiR/2brMcoWrJBc0O
	S0Ndvn9H8xG/9ocDLrBeqFEXonL5eHcrAgT2Xo0zS6xs6bwtZSShuOz59AfSVNN1qYDr
	vTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=z2Lukdt7oy8wx5fCKM3AWfjiKKTjLCfFaoZmBkxOCXc=;
	b=CRdS7N7DLrZBzlmscF9CkFQfameK4LaKmMX2N+HUCB35N8bHHLYtR/iXz73LYgdQfy
	MxbuFEqr2UvIg7PJgwQPNI/Vy3YZjL7on3EU68gP4OWmU6FbiOoN4cQ4y6Y8it/8KTpL
	OKzRsAOgRDNT+oSTAWce6LrX2gh/QDOvet0DI1xiKuA0thi46jYHfrFShNCUMqtt/kuu
	DoZxAX2Xf1IAxxLp0J1CnX02Fcm6kBdTH5rQZzB4/OlYxs3VyePtVCglK63f65XU1g2H
	G5yFbpYMe20Sl46+4pyERhxCtKefCqYA25edoKQNfepe42gmyv6a4z1qzq4TXu/Bm42n
	H3eg==
X-Gm-Message-State: AEkoout7w3X+Xvvdn4iWsu0Z93q8tOqg2qWMZWmdUnAXXLSQ6k9TdbgTyig+Ey/taMqOwg==
X-Received: by 10.46.1.69 with SMTP id 66mr25909393ljb.27.1470637681419;
	Sun, 07 Aug 2016 23:28:01 -0700 (PDT)
Received: from skeletor.greyskull ([89.253.118.72])
	by smtp.gmail.com with ESMTPSA id
	h13sm5350640lji.33.2016.08.07.23.28.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Aug 2016 23:28:00 -0700 (PDT)
To: bavery <brian.avery@intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1470627445.git.brian.avery@intel.com>
	<238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <db8cc8ef-f243-a2b2-93ed-cd85c8917bce@gmail.com>
Date: Mon, 8 Aug 2016 08:27:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
Subject: Re: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Mon, 08 Aug 2016 06:28:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2016 05:43 AM, bavery wrote:
> The openssh-sftp-server was already part of the pakagegroup. Adding the openssh-server
> lets the sftp server start up correctly.

If openssh-sftp-server cannot run without openssh, shouldn't it RDEPEND 
on it instead ?

>
> YOCTO #9362
>
> Signed-off-by: bavery <brian.avery@intel.com>
> ---
>  recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb b/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
> index c45463f..c32fef5 100644
> --- a/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
> +++ b/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
> @@ -6,4 +6,5 @@ RDEPENDS_${PN} = "\
>      gdbserver \
>      tcf-agent \
>      openssh-sftp-server \
> +    openssh \
>      "
>


