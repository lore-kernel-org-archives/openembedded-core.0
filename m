Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC2887D71C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 10:23:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n25so24604504wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 03:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=hhzwPyHJ6QuU8qJBuMfKp6SHviWhcSO3qvY3ejXnNVc=;
	b=I/gqDU+jIEDxCbbVcC9/2RKCJ/fApdTIyjZHaZF7nFHVm3Ggk/D1vaNklUJebfnsYV
	bxnA03AfnvftNpUVorlxNAo+91gWbwCIIILjaP6ajtKEZ9BX1JIKSQ3jSoO1KBgv2Hen
	w1rxMWK8YHf1KBRBNmhzm3IvMG1gMr9Z5sdTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hhzwPyHJ6QuU8qJBuMfKp6SHviWhcSO3qvY3ejXnNVc=;
	b=CEeaUKsTifqeMYKglL18xXonkKoNKj2L2UKeeI9EScsf1v+SO7Xul++GlGkBEWr7ja
	jgjuJAnB5uYs2d0ZXFuzwfS51PatXnDFZrD7crvV1h3d530VJLjIrbRHUo0nGjUB72qu
	AqrpSHjPNAGuogkPj55GTWeZKGbMD43Z8sRtpgTFzFre0GBQfCxZEBRIartorQIi2Sph
	JvVY1wzg8npZ/E9J3dHBx0lOEBT6QCmWfY7r8qsDlPqy9IKVSqJGqrKj4IPP2rlLJUmm
	p4Qp7HqIjwCHocDrQT4Y5vDkogHGudkS9l5OutNjR2JmYs5iEv7ZXGlu7iSs+RUOUMZO
	zhrA==
X-Gm-Message-State: APjAAAW5NYtv4ToyV/+YuCQZ+wSNg1cy2O2QxVycJoSC73JMRUWSlUTE
	TKvEy1cNPi/q8jw0Y6YE0b4Lig==
X-Google-Smtp-Source: APXvYqwFhL7W+8UEl9LaFToQZff+aC5fsOpOfZMwXMfAkapzBs4jRt4ezPoSLhJTJAGMhGqq5y+vVA==
X-Received: by 2002:a7b:cd95:: with SMTP id y21mr26497615wmj.29.1555410233749; 
	Tue, 16 Apr 2019 03:23:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v190sm29743240wme.18.2019.04.16.03.23.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Apr 2019 03:23:53 -0700 (PDT)
Message-ID: <b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Naveen Saini <naveen.kumar.saini@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 11:23:52 +0100
In-Reply-To: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Tue, 16 Apr 2019 10:23:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-16 at 13:59 +0800, Naveen Saini wrote:
> This provides git large file storage (lfs) extension.
> 
> Include git-lfs conditionally. If git-lfs is present on host and repo
> has lfs pointers, then git-lfs will be used. If git-lfs is not
> present
> on host, it will be ignored.
> 
> [YOCTO #13198]
> 
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  meta/conf/bitbake.conf | 3 +++
>  1 file changed, 3 insertions(+)

This sounds like we swap the current situation where things are
deterministic for a situation where the situation is not deterministic?

I'm not sure that is an improvement.

Cheers,

Richard


