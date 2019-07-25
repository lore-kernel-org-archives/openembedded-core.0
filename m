Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77BE37CE73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 21:45:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p74so46203017wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VQSYkDO0ecWnSZi8uWCoNieTXBpl49QpfVP0Vj1PpQ0=;
	b=KF4SiImNbHFrgjYIqpHl9+w79PeoJUmB3DcAChZZzzFXHk2to7rywTknPlihdKGi6H
	fzwxpP/WZykP2ukEUau3uBkPLrxWzOj2CgvBorpQhBxTV3oL6OdKvpDKtXya8mlPCDH9
	1IEB6ky56YnPZaJLtXSiguQQ12lGCY9SKVOgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VQSYkDO0ecWnSZi8uWCoNieTXBpl49QpfVP0Vj1PpQ0=;
	b=KnfIllV0bE9S8L9+Z7XLg++Ia1zagnbHvfoLioW5O8IjQSWB6oKr6VnIC859NwwUnC
	iQH2VmHAk7cV/dGOvpQyB86CwSXep/VdrnBu8kCz8AmZGqGFl6FkXXGcKaFuBmFT0jzY
	dyBJKeCpdxNlTWklbFodWlrjvjn2tI8A5ViNwRIlw8Rj+To08p2PLfblZZHoL84dEQRf
	v5tQOZajLMAhBst1CBS6USM+8p+0zR6f+ZfcN5BD7yC5Gjn9uOoueA9B3KVNJhdaxNN6
	tpR8CcPw6VCgKBqXnt2rDn8KZunwada/7PldvQzcCNo7uHtXxMiF17GiXyp8oTUXJG6W
	XSJA==
X-Gm-Message-State: APjAAAWdkaoTWUt2kPAo3Lu9mAV6o8qayWasR5OqHYIwVSz/Med4irZT
	lOpU+V4ZjwAQ9CWuLLJ/BZGCvg==
X-Google-Smtp-Source: APXvYqz0PkrU3z2REi9WNbzNtohZAj4cvEiDSW1/FfiWzArv3WhueG/4yrtvTaLid5KhyFhOx9MnKA==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr75175326wma.123.1564091109136; 
	Thu, 25 Jul 2019 14:45:09 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j17sm77580544wrb.35.2019.07.25.14.45.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 14:45:08 -0700 (PDT)
Message-ID: <fd395b9f9d74daabab0d2a3c3f37c8a486fd0bce.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 22:45:07 +0100
In-Reply-To: <20190725203037.33849-1-joe.slater@windriver.com>
References: <20190725203037.33849-1-joe.slater@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] oeqa: small modification to oe_syslog
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
X-List-Received-Date: Thu, 25 Jul 2019 21:45:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-25 at 13:30 -0700, Joe Slater wrote:
> Skip logger test if logger is not a command.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/oe_syslog.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> index 3a8271a..04f8345 100644
> --- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
> +++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
> @@ -83,6 +83,8 @@ class SyslogTestConfig(OERuntimeTestCase):
>      def test_syslog_logger(self):
>          status, output = self.target.run('logger foobar')
>          msg = "Can't log into syslog. Output: %s " % output
> +        if status == 127:
> +            self.skipTest("We cannot test logger because it is not there.")
>          self.assertEqual(status, 0, msg=msg)
>  
>          # There is no way to flush the logger to disk in all cases

Should we not be marking up the test to skip if the appropriate package
isn't in the image?

Cheers,

Richard


