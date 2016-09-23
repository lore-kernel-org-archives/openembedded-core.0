Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id B5EEE6074F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 06:01:35 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id e66so18853313iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 23:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=RM2mMkKuRmf8ztnJegGC4Dw+OIpuK5+zUMZhGMGI5GM=;
	b=d8lUomWPFlk2vFb4MLeRkq0BRaM3T59Qvp8+VD8Cyy11uyChWAjnhAdOYQ7Pf9m2lq
	cqH/yHIPNjdT0PdF9EZSJjQP7tRaEAdku5RZ8kAsCL0kEacXA+0JOuqqKo0UljlW9TQw
	UkVR9a+GpvtDbllDztZSsbBFbnwXSo22YSMfGcXXgZ1Mk3al1VAIzE58eUBnVskFf7T+
	yypAwxWHgg/pA2yHWCO5w5rdOd/FvxQvKbmUPB86SqoYsjC4f4PfECXZ00UOGW6qmcVp
	2s1bBItFg3QJTyYoe75dqF9Dqw+myquZrZibzgzgTRBE7UBU5Mn85RvcOoZrTQqUfsw+
	148g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=RM2mMkKuRmf8ztnJegGC4Dw+OIpuK5+zUMZhGMGI5GM=;
	b=LQBIewnJcKbILOMIuSgmY2oEdub+i4x61OBcMHRWOc6yldXaviRmBDdJ7Lph8pXlEQ
	qWiWiXd1nVnrc0QRI1F47TJ5HTL9X9g4bNBwmQSeus/8CzXABLWirOdyAse4w0GZcl6U
	G96Ez5Jlsb8zN2f7VJ8XcJMhYuJeW5O25ZAzcpaviD3jj96BDOpQWFjwhqwPegWwtvDK
	3HcRzuVpxdUFoZhaE/5g/japS/L+79fEMlEh6T3b42Y0L6J6G025vVNklz7tIa1rXcc7
	JdmN1FvsAsuLRqF4aagZ93B7Klwt23uo+M4GVkIka6RA7ouwvCkKcwkQqH8zQPmYxJt9
	13AQ==
X-Gm-Message-State: AE9vXwOeCK35U+tchJOGOqx4n3DcVjQgclIg0vahWdBVjb5gBlNe7OpSLqMQZ1lhwACY0xvk
X-Received: by 10.107.47.227 with SMTP id v96mr7098551iov.172.1474610496840;
	Thu, 22 Sep 2016 23:01:36 -0700 (PDT)
Received: from pohly-mobl1 (p57A56298.dip0.t-ipconnect.de. [87.165.98.152])
	by smtp.gmail.com with ESMTPSA id
	b133sm647441iti.14.2016.09.22.23.01.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Sep 2016 23:01:35 -0700 (PDT)
Message-ID: <1474610493.5472.8.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 08:01:33 +0200
In-Reply-To: <1474472342.16834.96.camel@intel.com>
References: <1474472342.16834.96.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: rm_work + pybootchart enhancements
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
X-List-Received-Date: Fri, 23 Sep 2016 06:01:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-09-21 at 17:39 +0200, Patrick Ohly wrote:
> new-rmwork-new-scheduler
> elapsed: 42:58.54
> final disk usage: 12873MiB
> max disk usage: 14230MiB
> 
> A bit better in terms of max disk usage than with the completion
> scheduler, but not by much. My observation is that in practice there
> aren't that many ready tasks, so often the choice of priorities among
> them doesn't have such a big influence. The lower bound of the build
> time is determined by the length of the do_configure->do_compile
> critical path and it does not matter much when the other tasks run, as
> long as they run at some point in parallel to that. Perhaps that is
> different for larger distros. I might redo this benchmark with Ostro OS
> XT...

When building the ostro-xt-image-noswupd in the different
configurations, I get these numbers:

elapsed: 1:52:59
final disk usage: 135963MiB
max disk usage: 136521MiB

original-rmwork
elapsed: 1:55:55
final disk usage: 33753MiB
max disk usage: 66832MiB

new-rmwork
elapsed: 1:53:33
final disk usage: 33755MiB
max disk usage: 69757MiB

new-rmwork-new-scheduler
elapsed: 1:53:13
final disk usage: 33754MiB
max disk usage: 65933MiB

new-rmwork-new-scheduler-additional-tasks
elapsed: 1:53:57
final disk usage: 33754MiB
max disk usage: 69173MiB

Here the "rmwork" scheduler again shows some advantages over the
"completion" scheduler (faster build, lower disk usage) as long as the
"additional tasks" are turned off. Looks like doing additional work
(like do_configure) is hurting more than it helps.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




