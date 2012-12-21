Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm52c-0005iB-TL
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 17:01:43 +0100
Received: from mail-gh0-f198.google.com ([209.85.160.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 07:46:55 -0800
Received: by mail-gh0-f198.google.com with SMTP id r18so2799977ghr.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 07:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=P2t6hnhDSGVOFlMzdxCmJW95Hap7vQuo9EveC0ST0Dc=;
	b=XSKVqKzMeJXpoOvaYN86hTmPKZIoIzMt0yJqrTk4nFyzclty1MDH9lxzGXJmdo262u
	6iSADB7p23oDyAUmxjif3Z0TVJNOT0wOQ+XFoxuqxGghPJrueVm+bzVD9gM+/ZhgwXdk
	QNtVPt0e3m9CX60wekj2ESjaNSSHFT3Uei6gQxjC7VTP4jEFhzuiZq8DuDxZ/KqRCGFY
	APR8KDwewm1YeBAL9ac7Qs9GG4G0NfdO58QwEzjjLo1QqCf9X4KPvy/foJfKOpRdERkj
	H/99dBlms60WfwfhwhLutXBNYSdI/oz/ndIWJ0SmawwXdFeF/Y+b6Qz/sG6CrwfWAy6G
	p9sw==
X-Received: by 10.52.37.9 with SMTP id u9mr17996477vdj.83.1356104814667;
	Fri, 21 Dec 2012 07:46:54 -0800 (PST)
Received: by 10.52.37.9 with SMTP id u9mr17996468vdj.83.1356104814599; Fri, 21
	Dec 2012 07:46:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 07:46:33 -0800 (PST)
In-Reply-To: <45d6f8871229e15a1bca91da7beeee99201ef7a8.1356094006.git.alexandru.damian@intel.com>
References: <cover.1356094006.git.alexandru.damian@intel.com>
	<45d6f8871229e15a1bca91da7beeee99201ef7a8.1356094006.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 15:46:33 +0000
Message-ID: <CAJTo0LbBM0AWg1Trx_ctKqYyC2RLYgkwBcDX=6F=3agOK8SFiA@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQk3vqnJLj+wYM6Slj9VG5JnwrIQ3NNgixy2IaxheGjChB/TdAmhpoZ0wdgKMg9WH7MXb10xmYgxekgbl7F1hkvBOq2j5I5GZd9/t4E/swoFKtngnZTrKpzX21pfrSn8DTpZZJPf23ZREYFHQ2h21R0JjwDocOPDi1lhX5WmewVRAZNXsA9iIqCtDFPLrsMOBbuEr4aI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Initial commit for wayland/weston 1.0.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 16:01:43 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 12:51, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This patch adds the Weston reference compositing
> manager from Wayland.

How does one test this?  Instructions on how to get a nested weston
under X would be great, and something that can be used to verify that
weston is drawing correctly - be it a set of toy apps, the terminal,
or something else.

Ross


