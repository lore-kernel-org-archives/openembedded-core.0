Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 98FE265DC4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 17:05:42 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so1314296igb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tdwo8hpsWAtWBZxBYlnTcXUd+YpDfqgN0Lmffhf/r/M=;
	b=tH5mwgD76FXlr1BKjI7Zl6IXEEfA7Z3P0Ia4snzsvFzsstls8GAYG/qGjW60TcY6XB
	1KcdWSb8yEjuxvjKDLGmzG7B/q3LT/yDvxMFHWfw8gTWP8NB998pcxXz3cU72OvX42dE
	NYT7RibPnY/KmqHNS/WJjAlP1kKcP6qGV+uCi6h5Y01chpwGUl/s1MU/5jINobzYHnSG
	m7BcmkdPlKs6s4V2NmG2ijaF/YRx4r0GOrEq+ib1Nnr+/ZXMEwu22RSYKF7mEA/xSAIZ
	NWV1ymgVWPQ+sba4izbTca96Zfsvphl7jwNGXx9YDswkup1aZlrb9YrZtLKbLg7lf1lQ
	i5rA==
X-Received: by 10.50.60.103 with SMTP id g7mr27324953igr.20.1396976743615;
	Tue, 08 Apr 2014 10:05:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 8 Apr 2014 10:05:13 -0700 (PDT)
In-Reply-To: <1396965637-4802-2-git-send-email-fathi.boudra@linaro.org>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
	<1396965637-4802-2-git-send-email-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Apr 2014 10:05:13 -0700
Message-ID: <CAMKF1so-wo3wsD73dfbUEXYpCEMTxXgPBzqiKucCMVDYnFu+Sw@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] trace-cmd/kernelshark: update to 2.3.2 release (latest stable branch)
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
X-List-Received-Date: Tue, 08 Apr 2014 17:05:45 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 8, 2014 at 7:00 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>  do_install() {
> -       oe_runmake prefix="${prefix}" DESTDIR="${D}" install
> +       ${MAKE} NO_PYTHON=1 prefix=${prefix} plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
>  }

can you explain/document this change

