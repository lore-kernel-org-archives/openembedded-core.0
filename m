Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id C525A72F0A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 20:09:56 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id 72so127924267uaf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 12:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mhBiEhARVstbTvbe83dpGXZHJuV34f3Ml58PCltZU78=;
	b=Mdld/fYFAZFHRKVgyZLXMu/Fo/WQ9wBJB44ceDXX3eUyN/K+zTFUPfSO5qmmSY7Iad
	2C+SeYGEdWh6e5lQDhISp4Iwt53pwde32Vv8iWvEU6BwP3RGFUPUowyNkH6TJAS4NP4J
	X0rN/snVM/XQ/4KlM4XUID2c5iNPUheV9q91PNg/WdZl9SbY39k5QlrQVFVFL0vkha00
	bSLAqI4Wm5FkGh96YgnOftJ0TWNWPIASJKu0CIWMtm9Tb1XSfboW0y2xDGpp7H5fohfH
	MunBxIPhbH3o3zZV1qgkqVC+OCUVWiUr+3RhR8aFieEFaow1bXikN9yRgKWD0pHdVcXw
	OgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mhBiEhARVstbTvbe83dpGXZHJuV34f3Ml58PCltZU78=;
	b=X78xW+UGsujdY6s/qZzwrbJ1+G9B+dhVMFFrbaX471ri71/fZd2Ro1kHwsjkJRt2Fh
	BhWVPPXnxJVt8Qc5pE9A0xA7IeKo0tQ4OFyr5QXHtNaTFldc2YXepBBwda5PUzwWl9ra
	YfnlCCWz+yz1oCUCl3yGXgMKYgSLcGeFVuX/5ujDlvrclGxuqNE4R19tQHL7CRrkt2WU
	IJu1WDjdc6HRMhmv+3ue5T7/0Q2NmYeEuJSD2WmhpIulIoLVxLsDXt30JKV+0MWZ1Ila
	YrSRBqmO4CWjjwYmrSxYnapJHzKfyejhFnXIisN7dL2aOVQHVUe75j7CPH0Zh4qyusUH
	sXKw==
X-Gm-Message-State: AMke39nh0/myw2lVUPR3j2fiPhljQWlBvgoj3i96XEElB+tPH+WwLhKV/4UEWZ6xPCiQz+SKePj5dq+0z2cPAw==
X-Received: by 10.31.6.73 with SMTP id 70mr1752511vkg.173.1488571797619; Fri,
	03 Mar 2017 12:09:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Fri, 3 Mar 2017 12:09:27 -0800 (PST)
In-Reply-To: <7f8eeb62-a767-0882-dcc0-9a6882192d82@xevo.com>
References: <7f8eeb62-a767-0882-dcc0-9a6882192d82@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Mar 2017 12:09:27 -0800
Message-ID: <CAMKF1sqAw-rwkKYuEsY4QN1rA-YyQcx5hjpzux3cLk+4qxAemA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] LLVM shared library support
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
X-List-Received-Date: Fri, 03 Mar 2017 20:09:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 3, 2017 at 11:15 AM, Martin Kelly <mkelly@xevo.com> wrote:
> Hi,
>
> I noticed that meta-clang builds only static LLVM libraries, unlike the
> meta-oe version of LLVM 3.3, which builds shared libraries. In fact, this
> appears to be the LLVM upstream default as well.
>
> What is the reason for the difference? Shared versions of LLVM would be
> useful for reducing the size of programs linked to it and making smaller
> filesystem images.

meta-clang has only provided static compiler thus far, so using shared
or static did not matter as much in fact it could be helping with
faster compile
times that we see with clang. However, there is no binding to keep it static
link. Feel free to send a pull request to change it.

>
> Thanks,
> Martin

