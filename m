Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rpq84-0000Dh-3U
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 00:50:20 +0100
Received: by lags15 with SMTP id s15so2679660lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 15:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=7lhHSqS9AYehYCbKRZ7AEo1GfTnUedZaHxrU9QDMJcM=;
	b=hrXSzJhKT1yiCjbq+vcQoWjgCvHR7uvjolmjk6Mt9V27bqL3IYSTGBSEdp9IYSkOl/
	+24MLcsoetZLAvECUftp9hXNDUPP5Xsreh97txCOKO1xdRHdn+B6fsO+oxiFacFtg9vF
	JxgbNq4+x/Gf9tM7Mp8aTXlHFNseSjA/B4uWo=
Received: by 10.152.114.169 with SMTP id jh9mr7571217lab.20.1327448554271;
	Tue, 24 Jan 2012 15:42:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 24 Jan 2012 15:42:03 -0800 (PST)
In-Reply-To: <f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
	<f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jan 2012 15:42:03 -0800
Message-ID: <CAMKF1sq=xpgO=4Ne0YQdkhqXhh_+VcpA2Xyx_Cm3xccUcv3d2A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 24 Jan 2012 23:50:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 24, 2012 at 3:26 PM, Joshua Lock <josh@linux.intel.com> wrote:
> Long term we should look at moving perf to a separate recipe but as a
> short term solution this patch will ensure that when GPLv3 is in

would I be asking too much to do that instead of this patch :)
I think it will be good thing in general since other layers
now have to define these tasks if they inherit from oe-core kernel class.


