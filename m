Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkTOp-0003Jn-ER
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 07:05:43 +0200
Received: by eekd49 with SMTP id d49so1101040eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 21:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=7zxqB6MnyEAPqNy8lJidlBHkGErSMOJYOcMqkImXDCo=;
	b=bDfzsMn7xUW2Ng3Dem03qzQS7/T+75wYEN8Sbhg1+u+XbELI3Ae2eE5i884xVwKX3e
	nDr4th3sfN6DOyZwxv032y7j4grFc5zNAZXqW1IjbkjOwgNCXBrKHso1vlx4sxncokNk
	LRxS7A7MwrZrFtfKU2l0O9cjaf3NpNL7htD1FrcwZEpRaRggto58g2Q887gX/iznR66B
	A/Ub4s76ydjizdev0p8W184ORJMyizSAejxTNYXIP6XVQB+LIYixuRbrwP/rpKJoVg9U
	NWy4ee+52SOawzoMOE4PvoCA2Lu5Gfd7HiAFRLPkSmhmtq49wUluXIEzPh31kGSbjM6U
	y5RA==
Received: by 10.14.97.16 with SMTP id s16mr78689eef.117.1340945688185; Thu, 28
	Jun 2012 21:54:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 28 Jun 2012 21:54:17 -0700 (PDT)
In-Reply-To: <4FED0AD9.5010102@windriver.com>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
	<63976f811fe5cb0c5688fe6847975499ac2d9e51.1340773014.git.liezhi.yang@windriver.com>
	<4FED0AD9.5010102@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 21:54:17 -0700
Message-ID: <CAMKF1spBJ-iVuHC_BxscqAw355gUMCYnh_g6zwT4oOwz91hxyA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] icu 3.6: do_install failed: Segmentation fault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 05:05:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 28, 2012 at 6:54 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> I've changed the cmd[BUFSIZ] to cmd[2048], which should be enough for us,
> and
> pushed it to the git repo again:

ideally allocating a string on heap and then freeing
it after use would fix this issue once for all.


