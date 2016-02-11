Return-Path: <oliver.graute@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9612B7002B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 09:45:47 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g62so13358442wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4zWZ5gUxpu5UUk4d+2pfwyAonKk8ixS0U4tQA5nyL7k=;
	b=nl20wRKEdc2H0QzuQMzhEMR+AsbKbwc1iz+tiUXuRMSRX93uu0DEe2rvRjKcE7uenp
	4ov8HbiBG/BLR9R7VcAhzGdBhJZE+6j7La6jEoIIPJO19xnyQuQYmO4PS5zp7rmY8Gg6
	7vkcjS0IIl0CSwyJXkIpvslZ4qGr0FWv941HJKpq/zp7vZ0uGcaOW62JmPYqdjo6T758
	570pdBpPgKOkM9AHxLrBMMw1lfb6fRlc6U5xpGXgQsFSDjsypagVsmHjL9rMBszQzEG0
	XMKv+C7PQefqHDL665VW+PAZvRWMkgYG1+zN5xfaYS+LhePpHtU4tHQEWYoOJ5B7FQUo
	+LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=4zWZ5gUxpu5UUk4d+2pfwyAonKk8ixS0U4tQA5nyL7k=;
	b=HaxNQgwxNEvpNpAT8IOB6rQRcar2+F4XJLEYc5SW3on9r9q5dDlFRBBVU5QZqFcqo7
	03/weI6p9zG/Szza/h03YRj5eEiL74zvGhjGBr2QO7/Ei0BZxJHdeDuVa970MITyINNe
	zTyJ3NbZdsSUcWukd/P/YBai7Sj4p62y7Ghyjvk5b2oC9VSZCSocahZGw5vBfCdadZNx
	zqBAW7Gnuqkc7txjUcbXV5mhlu52eWPeqpRA8UgWB3WwlIU8j0ZTpgmfAYZsgwz6PpdY
	DArQSix7DAlotZumjySYiMEuYrymlnrbztzQdWEP+L0EL0vAjDd9Ersgn66dK4xSyyou
	ivdQ==
X-Gm-Message-State: AG10YOTyL5rcf6I8whwFtjcS55ep3P2374n5XxYup3QLdoEA5rN4Ics4jWHpkWbJGPh1/g==
X-Received: by 10.28.1.9 with SMTP id 9mr15593979wmb.97.1455183947359;
	Thu, 11 Feb 2016 01:45:47 -0800 (PST)
Received: from localhost (x55b1ec6b.dyn.telefonica.de. [85.177.236.107])
	by smtp.gmail.com with ESMTPSA id qs1sm6766489wjc.2.2016.02.11.01.45.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 11 Feb 2016 01:45:46 -0800 (PST)
Date: Thu, 11 Feb 2016 10:45:45 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160211094545.GA6979@graute-opti>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20160210161458.GB27824@graute-opti>
	<20160211063821.GB4868@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20160211063821.GB4868@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: create_image.wic is missing u-boot SPL file
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
X-List-Received-Date: Thu, 11 Feb 2016 09:45:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 11/02/16, Ed Bartosh wrote:
> Hi Oliver,
> 
> This looks like a bug in wic code to me. I remember something similar
> was fixed recently. Please, create a bug in for me in bugzilla.

Hello,

filed a Bug for this Issue

https://bugzilla.yoctoproject.org/show_bug.cgi?id=9094

Best regards,

Oliver

