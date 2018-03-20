Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 880D678226
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 12:05:03 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id w3so824921uae.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=yvS4OCSXleQwp7Mn8Q+AUv4belTxuT94tgQMQZwyEQU=;
	b=oQnkEVvBbGu5Md/cdmPVOBHDnMesGMjX0GbeuLsXPu80i8n5amKoXRu1X7C0aJ4tn6
	ug4Dsm3eBl20QwTaoXg9FWqXEwUNqcz5jBi5VIW3ZrzcZXfaEPO7uJjqJus0l0F/IvIE
	GqSWpLHnhUGQTScVTZ6uhK/E7d6rRhPQKsl8LTIOL4horFODGtP/bLlrE1/SJX5ay3a7
	qoF6LbD8HPAZJvT/Vwu5LQX+uyNl8T9DQly0FangIOd7QvXmv1TwltIFlM/8pLquMU50
	Bi2ZwrodgYRmgAkWwogwo14OutfMnULSWls3pJlNhNdd/NMNGYaIkMO6ewKQRf6Wt9xd
	VeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yvS4OCSXleQwp7Mn8Q+AUv4belTxuT94tgQMQZwyEQU=;
	b=N5trtmDhn2EqxiQFc9lVRP6MbRUrfDmIRzgwmc0RAUbPjRC+JmQklUq9zGWQmaaiTA
	PYZiSbc5cqM4N16BNPLl1pq6XnnNp2F+dk0mU5L4o5SSrR6mXfrUwU0+/5tDsi0mLdrA
	WOFBkUSyyrjv3qWj+IGIsBr5dVtAzFcqx3BfbpIM52GQha4I9sFlBQX6dCEFCLcbQAJC
	aJL3dh4GTzowMBKvSarefxcac0fBJC1HvX8bR+K89zgVyy7oSGeq0FNovipOw+cXVZIf
	MlAgWrpKOm7wC7gI81vYvN09nf4Fc0zUyMCzB6TZlQwGQSM7BaHnW2SOK9hV7OV0ycAV
	ZVLA==
X-Gm-Message-State: AElRT7HwuIIcarJaShekqJgAIlFdkNNmilPdZlvdcnOebG2Vdu8Rsbcx
	5VKVqaCL2/7SHQ0+eDuOueAGBk7+PFOw6dwz7Ec1Vz+T
X-Google-Smtp-Source: AG47ELue99sMC0Qh3r58ZDBgFrwvzaJOL8nThvmAC6Wqu2Sv2yksnFl9VjZjZM9n7P10dmY55QtWL5ASLHzEmSA3jiI=
X-Received: by 10.159.61.203 with SMTP id e11mr3784611uaj.115.1521547504815;
	Tue, 20 Mar 2018 05:05:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Tue, 20 Mar 2018 05:05:04 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Tue, 20 Mar 2018 17:35:04 +0530
Message-ID: <CAPGMVzHSpbw+h_dbc=-9Cdm0_Q3o4EnOEcjH6fxZ3kpv6wwGNg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Packages build via recipe
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
X-List-Received-Date: Tue, 20 Mar 2018 12:05:04 -0000
Content-Type: multipart/alternative; boundary="089e0824502888938e0567d6e2fc"

--089e0824502888938e0567d6e2fc
Content-Type: text/plain; charset="UTF-8"

I have been trying to build keras and tensor flow packages on yocto's image
that is poky but not able to do so since there are no recipes for them.


What's the way to add keras and tensor flow packages to poky?

Thanks

--089e0824502888938e0567d6e2fc
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><pre>I have been trying to build keras and tensor flow packages on yocto&#39;s image
that is poky but not able to do so since there are no recipes for them.


What&#39;s the way to add keras and tensor flow packages to poky?<br><br></pre><pre>Thanks<br></pre><div><div class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr"><br></div></div></div>
</div>

--089e0824502888938e0567d6e2fc--
