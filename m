Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5C47D101
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 14:17:36 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h4so12259899wre.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 07:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ivKEErz96b3mBCPasY83UV0slB+6mGzLt6OT2b4tsFA=;
	b=BwtCujB9weOSwjfbS9wIH8Zh4KVtRRVdqVE25CGJ0jHNSGq5tNqeQHAaV/mwBOBvJA
	q5cPURoknI6KD6mULN2oQE7nKBXN7vvrgIujz84YddRHJGtecrYdSZwCpyuuv/Dtn6rq
	jrF7F7yFEmnnL8ATEantDkFwGfTVR16/SO3PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ivKEErz96b3mBCPasY83UV0slB+6mGzLt6OT2b4tsFA=;
	b=YTna/T7Jom30K2qkVLm2+YlvykJ1YNIisH/QYY9eY3IOyyMjBOq1I4CBE1LqdKTMnk
	42vn/tXg5kQ2NtahfP63xhza1uojuQlUM7CiKe5E2j42hX/g4aGQYEMeq4nuc5/jvtf5
	W3veMMjejsgam6V6fhIiFI86m5kndxzV4R7aXDq1k8T5ZHeQ0ut+nQ3PXmMciw2bKO49
	7gL2uZjOL63I1sFkuoczYvYxBM49MaAilVZbx7ToQUeBej5HmTFLfVoNj3KxGW/yUv5t
	H1Nn8iKNWoMv26Ce0e6gyM+77qEz6A6zkIgF1qsi7VG5SHB1P6od7oCllWkD8p2UbCnB
	zULA==
X-Gm-Message-State: APjAAAVGLEN/uAk+B0PX8biRO9zDd2isX4+m1b6VqVV+4wg8WPSPNZY0
	MX9xo727v6GuiM66Y0xl3v49Nn+N2Mt44w==
X-Google-Smtp-Source: APXvYqydGDJEwC2xFyweI8nltrdLWH5SVOJA9kTNY3qiOJL6eAPt5YfWhqrUsn9a4b21yFC560lMng==
X-Received: by 2002:adf:ee50:: with SMTP id w16mr448398wro.293.1554128257080; 
	Mon, 01 Apr 2019 07:17:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f10sm12120072wrs.17.2019.04.01.07.17.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 07:17:36 -0700 (PDT)
Message-ID: <a23f92e9535e3c674a0fd8e7e5563302c222ea0d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Apr 2019 15:17:35 +0100
In-Reply-To: <20190331161757.12888-1-open.source@oleksandr-kravchuk.com>
References: <20190331161757.12888-1-open.source@oleksandr-kravchuk.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] quote: update to 4.05
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
X-List-Received-Date: Mon, 01 Apr 2019 14:17:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-03-31 at 18:17 +0200, Oleksandr Kravchuk wrote:
> License checksum from quota.c was removed since according to the
> project, copyrighted code in question has been replaced with own
> implementation (see @bcbc0d08e5cd).
> 
> Removed patch has been upstreamed.
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
> >
> ---
>  .../quota/quota/remove_non_posix_types.patch  | 198 ----------------
> --
>  .../quota/{quota_4.04.bb => quota_4.05.bb}    |   8 +-
>  2 files changed, 3 insertions(+), 203 deletions(-)
>  delete mode 100644 meta/recipes-
> extended/quota/quota/remove_non_posix_types.patch
>  rename meta/recipes-extended/quota/{quota_4.04.bb => quota_4.05.bb}
> (80%)

Typo in the shortlog (quote -> quota) and also:

WARNING: quota-4.05-r0 do_patch: 
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch fcntl.patch
patching file quota.h
Hunk #1 succeeded at 182 (offset 17 lines).
patching file quotacheck.c
patching file quotaio.c
patching file dqblk_v2.h
Hunk #1 succeeded at 7 with fuzz 2.
patching file rquota_client.c

Now at patch fcntl.patch

Cheers,

Richard


