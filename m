Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9099671999
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 11:34:02 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id c7so49210973itd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 03:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=SjEW3ShVhimbxvwQLWqWg0PwbIaTssIqgHo1yWaZ05s=;
	b=kqSJJz3i9z/632wk6hS0PID90P01wtWLrYYnjSa1XEOqLfg0qUqzFCXvIpce5p2he3
	QiQjiQ2psWhML6Hu0vDz4fPFl6mrHHs4O542rHkMgoy/aNHEKM05+ecu77TrDG8OQQ8H
	73vhJ5GV8OhYsCDZdL+0cKTL0ZPS4Y89++drmNS/NHnRXWn3ZcNknArft66iGKVbiZww
	wasegQTQzixvTZELNSvrkSYc3y4SXkBGyTkWiIg7AZ4YFIQTk/h5AnIZjK28p2olugrg
	/+y6M/LvHUBJSLsikrRtNdsActxVSx0+oO0J29Y+Wc4GvihJ+PE8u2TglKVEhEE0pqzU
	j4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=SjEW3ShVhimbxvwQLWqWg0PwbIaTssIqgHo1yWaZ05s=;
	b=N5igThyZz0jfi6uk4bWEoob2FXPFS9v2K43TkgDYiH8VVsVOVu4z8Z6BCDC47Bs1eS
	jo0ZWOsM8AeWVlw5piAo/BIvamS2DN/FpJF3PJezcUJxvaUqCfOGPkDJfiT1yRJX7+VL
	S03xmI3KMgG9AGC5HdEiQ5uPQrx5KvSS97UMefcMzxmrqpHUJhvL4qK6DmWvlH8HuJ9i
	VLqfsx5jzbmbJWVlgujM84VeaPl9RDlGRrcQBPUwiBxAMJOt+L0r/ImwRGPovsa8yynY
	wHwHXvwdTqSu9U6YP814zg+KTMQqc9lXomToo0eNOPHZskTb2zOCuyxxsRBmszGukIzm
	Jgig==
X-Gm-Message-State: AIkVDXIhc3g2h6v1iJvbRUQDGnfrSfGModtoAI/8h3bKGu+QLcTsVsw+W1Uea1WaaX74oIJr
X-Received: by 10.36.170.68 with SMTP id y4mr10455817iti.7.1485084842716;
	Sun, 22 Jan 2017 03:34:02 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E414.dip0.t-ipconnect.de. [93.232.228.20])
	by smtp.gmail.com with ESMTPSA id 202sm4617243ith.7.2017.01.22.03.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Jan 2017 03:34:01 -0800 (PST)
Message-ID: <1485084837.20333.4.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Sun, 22 Jan 2017 12:33:57 +0100
In-Reply-To: <1484950557-27915-1-git-send-email-anibal.limon@linux.intel.com>
References: <1484950557-27915-1-git-send-email-anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3] qemu: Upgrade to 2.7.1
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
X-List-Received-Date: Sun, 22 Jan 2017 11:34:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-20 at 16:15 -0600, Aníbal Limón wrote:
> Minor upgrade contains fixes from 2.7.0.
> 
> Removed patches (already in upstream):
[...]
> diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.7.1.bb
> similarity index 66%
> rename from meta/recipes-devtools/qemu/qemu_2.7.0.bb
> rename to meta/recipes-devtools/qemu/qemu_2.7.1.bb
> index 0d680a7..8180c5f 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.7.1.bb
> @@ -9,16 +9,14 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>              file://no-valgrind.patch \
>              file://pathlimit.patch \
>              file://qemu-2.5.0-cflags.patch \
> -            file://0001-virtio-zero-vq-inuse-in-virtio_reset.patch \
> -            file://0002-fix-CVE-2016-7423.patch \
>              file://0003-fix-CVE-2016-7908.patch \
>              file://0004-fix-CVE-2016-7909.patch \
> -            file://0001-pci-assign-sync-MSI-MSI-X-cap-and-table-with-PCIDevi.patch \
>  "
>  
> -SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "08d4d06d1cb598efecd796137f4844ab"
> -SRC_URI[sha256sum] = "326e739506ba690daf69fc17bd3913a6c313d9928d743bd8eddb82f403f81e53"
> +SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
> +
> +SRC_URI[md5sum] = "a315bc51ed443a08d2cf1416d76b9ab4"
> +SRC_URI[sha256sum] = "68636788eb69bcb0b44ba220b32b50495d6bd5712a934c282217831c4822958f"

Looks good to me, thanks.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




