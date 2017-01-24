Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 463E0719DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 22:05:12 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y143so12845878pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=Ube1Td2U58hRxN+OCGxTfyuvkLKj7MiMDP89kV25ktk=;
	b=gMMli9Ea8cYVNrZio4bhq3PZepOq6z0yPelECnFQ/+gptTVQBXcFoJ9vIP6UrfrA3g
	fQC9sgrukVb6TsgOc5L5ZJVZD9IoiL+qIl4/uWGc4WGCmQCe3jtnXLt8XfSPrJZYDWSl
	G7ZlD5TPInH4nKQkugMxv5wX5T4x3tbb7SkI/Of/rjYsSp7MVmrNnBXQroI99085VrM+
	iM8yQWnGdF/4ZEHcrZeC1h8C5sE6cc+J9ofB9BY58QP+3FpsFCncCaHAl+SEIDZrCIwT
	XMZVsVUWOK1R5ScLumPmTx7FT0OohmnqAeXSvuT1ClQmX6lpLWS4fIwuwquvvmayfdhW
	oPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Ube1Td2U58hRxN+OCGxTfyuvkLKj7MiMDP89kV25ktk=;
	b=gUxWJvoY7pxC9ptTwtjz3tYHbTKmqqx6LjmKVzSmJzh9UYQ1uz5prq2Zx6AL8mE3Ip
	7JHfOEhOcUmHEwHCriqU7UM4y2xkPgCEYCMH+CxlB6xnT1uv/xSXUGQzltk+T6b+qgyK
	Hj11rlpw/ZCcke2x6311ccTlO4UwqahQTl5qR5Tce5WoD1/07CPxRhsonG8b7p+4T1C/
	dmPYsVnAJlQQIwej2ALkKvMVvSVdlq/Ox5bTufLSsIoxk+JBc7iIIYe4SqqAavR1oj7J
	n9/bdkBnYnIi4EarOcmZuRIaCT6tiE2i0qLASpVeI5Mr8JaNssxzGo2wNDu4TSxCrvC7
	VgNA==
X-Gm-Message-State: AIkVDXLwWEESXb1rn+FkzQxqPlZIoBcvdJw/b9d4h3wN+ejHG5aYZRRYRndHesbJ9VSwZQ==
X-Received: by 10.98.223.66 with SMTP id u63mr42271673pfg.39.1485295513072;
	Tue, 24 Jan 2017 14:05:13 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:e1c9:6ad8:d150:f0f9])
	by smtp.gmail.com with ESMTPSA id
	f3sm47062809pfd.10.2017.01.24.14.05.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jan 2017 14:05:12 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <6e2081903352fbfbc818384ce44dc58c3da507e3.1485265775.git.maciej.borzecki@rndity.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <5ac6e942-a4af-b333-b8f2-45655548915d@gmail.com>
Date: Tue, 24 Jan 2017 14:05:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <6e2081903352fbfbc818384ce44dc58c3da507e3.1485265775.git.maciej.borzecki@rndity.com>
Subject: Re: [PATCH] staging: fix logic of guessing dependency manifest file in extend_recipe_sysroot
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
X-List-Received-Date: Tue, 24 Jan 2017 22:05:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/24/17 5:50 AM, Maciej Borzecki wrote:
> Recipe sysroots introduced a change where dependencies ending with "-cross" also
> count as native tools and (see setscene_depvalid() for details).
> 
> The same logic was missing from extend_recipe_sysroot(), hence for depency named
> `go-cross` the manifest file would default to
> `manifest-allarch-go-cross.populate_sysroot`, while the correct name is
> `manifest-x86_64_arm-go-cross.populate_sysroot`
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
> ---
>  meta/classes/staging.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index fc387eaf4bb52971e111ae7deac7d7d6fc389337..efea450e4f73661366d0929d5c39e42bfe9f8e8b 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -521,7 +521,7 @@ python extend_recipe_sysroot() {
>              native = True
>          elif c.startswith("nativesdk-"):
>              manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
> -        elif "-cross-" in c:
> +        elif "-cross-" in c or c.endswith("-cross"):

Perhaps you can change the go cross recipe to use something like

PN = "go-cross-${TARGET_ARCH}"

>              manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-${BUILD_ARCH}_${TARGET_ARCH}-%s.populate_sysroot" % c)
>              native = True
>          elif "-crosssdk" in c:
> 

