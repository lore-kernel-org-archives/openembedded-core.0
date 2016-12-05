Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF4B600EA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 07:26:13 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id a124so582224955ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Dec 2016 23:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=usOxoI9weIbclrCzYvgvRUpAQtKLEM75IwW4qL5ksu4=;
	b=iqvW6pLZM29bdVrio/rgZXoWPu+mAFq3QcwzwXcA0tte+lbzmefjxZeP1uww5dKgd9
	utVvi2BAehYN/kHR2PpTKKZHvZ9dBKQy2UFxCTWsPEa/Ld3CuN0+xsvp3RVWBxjg5SbA
	n/Wbj5jurHNNZ6rtaOoX9jaHtaiytEgtGCvwVNrAWnIoAN5yYz4raIvVBdL2BwptpOT4
	pHfd9ueUQnT7v98LceyvKoLqhvJ7E6cvL2+m9yJ6+IRdPl8cPXiDiC/EWFDXA4O/z/Py
	JiOIUvumpiF1YBb5SXwlvo/DD4Cxi7tkXC9WiAccpVKrPyGsTGyFiN/cV9yfNxqKvVgP
	vGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=usOxoI9weIbclrCzYvgvRUpAQtKLEM75IwW4qL5ksu4=;
	b=egwgL8uYOjYeL16BcxYWBkE4m5Y9CEqsh3xlbcQMZUSTacqzrE7VcZkfmSW0auLgjr
	1QMVnBDV9GS9azco05kXdA+/xiP3JMd9TB2tQ/DGIXmUNgpOSLQrZwW44OeYS+Qcn/Do
	TAYoouEUCHLXKZOJ1dc0w6oGPpLupwBrwzTAzyb3aSbpE7+a1jfK2A7wnYFxKYwTheW/
	LV+XD2E+mkk+uBmUr/H8IpiFt0f2PTlEBQXWa/sNIERQg9leOXepbeD9sg5iv/qurxlW
	e5/4spqUjnzBqRVWA8MlE4PV+2rdgMOSjFfmBr3U+0B6Ywjnh7PAeetRQ/uafgDXM+Yr
	Yijg==
X-Gm-Message-State: AKaTC03Tn4cd3otRywuuOs9QDO04f/KmabTQwglkYdSn7kmhsvaF/zLUVXXpdxcHmV7kS0CP
X-Received: by 10.107.132.140 with SMTP id o12mr49370105ioi.184.1480922775362; 
	Sun, 04 Dec 2016 23:26:15 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D0EB.dip0.t-ipconnect.de. [93.232.208.235])
	by smtp.gmail.com with ESMTPSA id p20sm5799747itc.8.2016.12.04.23.26.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Dec 2016 23:26:14 -0800 (PST)
Message-ID: <1480922772.17535.24.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 05 Dec 2016 08:26:12 +0100
In-Reply-To: <1480585246-3278-1-git-send-email-patrick.ohly@intel.com>
References: <1480585246-3278-1-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: [PATCH] libarchive: enable non-recursive extract/list
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
X-List-Received-Date: Mon, 05 Dec 2016 07:26:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-12-01 at 10:40 +0100, Patrick Ohly wrote:
> Required for meta-swupd performance enhancements: in meta-swupd, the
> so called "mega" image contains a rootfs with all files that can
> potentially be installed on a device. Other virtual image recipes need
> a subset of those files or directories, and a partial extraction from
> a single tar archive is faster than letting all virtual image recipes
> share access to a directory under a single pseudo instance.
> 
> It may be necessary to extract a directory with all of its attributes
> without the content of the directory, hence this patch. Upstream
> agreed to consider merging such a patch (see
> https://groups.google.com/forum/#!topic/libarchive-discuss/JO3hqSaAVfs)
> but has been slow in actually commenting on it, so for now it has
> to be carried as distro patch.

Ping?

Alexander, you touched libarchive most recently. Any thoughts on this?

I could carry the patch also in meta-swupd, if that's preferred. It just
doesn't feel very clean for such a layer to modify a core recipe like
that.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




