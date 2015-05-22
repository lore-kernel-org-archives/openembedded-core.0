Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 45D5D7420A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:30:40 +0000 (UTC)
Received: by pdfh10 with SMTP id h10so18643124pdf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=p9N6cKJWSKkA8hCwPlVlEINiIeT7M6PdGKV/oFBSEdE=;
	b=XrQUKLiRzGRShyteHzpX9HmYRL1JC3PpePUf2d5V1V+FGkor2Dik1CbDp7mrfWbhrC
	xXXG5bF/YuJWiBUsxwPv4nfjo8PZqz7Tko79wcosmn9i0J5Y3/aWDQYnB1JFdZ+abLoK
	GXzZD1pAeyaP0vPYU1nYVGwWMrnvc/+SlSdlKWlCd7521El/u/CNavSJ0FTQT7QliGVf
	oe7wqCt81q2BiHd4D47H5JxKzQUs9YSil1OIJ5jvLiSN2nTy99BDqGZKd11GDlUQCy1s
	EnFTZ5yzcPYgPS9fp6uI3Pi8+3QgB3fa5VdTNcENdx4qQi0BrLxagvKVGqIjgFxzeser
	fIjw==
MIME-Version: 1.0
X-Received: by 10.68.226.4 with SMTP id ro4mr8397767pbc.108.1432297842188;
	Fri, 22 May 2015 05:30:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 22 May 2015 05:30:42 -0700 (PDT)
In-Reply-To: <1432294706-18789-2-git-send-email-ross.burton@intel.com>
References: <1432294706-18789-1-git-send-email-ross.burton@intel.com>
	<1432294706-18789-2-git-send-email-ross.burton@intel.com>
Date: Fri, 22 May 2015 09:30:42 -0300
X-Google-Sender-Auth: qC5d5Rlvnt2Na2grEhqclav1gUs
Message-ID: <CAP9ODKrVE0nkZR1s+NrXOKp_=9uqTzMoS9VvZUZSeJPVzV2tjA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bitbake.conf: programatically generate COMBINED_FEATURES
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
X-List-Received-Date: Fri, 22 May 2015 12:30:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 22, 2015 at 8:38 AM, Ross Burton <ross.burton@intel.com> wrote:
> Instead of hard-coding the set of features that can be considered in
> COMBINED_FEATURES, simply generate the union of DISTRO_FEATURES and
> MACHINE_FEATURES.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Wouldn't this be a intersect?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

