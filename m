Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id E872765C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 13:26:19 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id 83so2413807vkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=E3EhNBV7e8BNooomocGJNns1MUJVyBJhOnBV3saw+9U=;
	b=RHxYmCX4mqFoQquEJBsYV+TOuvQSA5AQj2vajQF8JBZD7pdUz3KRb7Hv462StQIwYL
	qftyRV0rMTrY6dYcgpz7I8ADGu3oRqoxPDfmSeK8hq6aA6juBQkogdaQqOadBz9AxG9o
	7hMDunP0QFAuWADygvfuyCaj53LDATPsgRa1TiezRsQg3rFlSAPlSyKTR/lKbS6yNL+S
	pgXxMDdn00zy9diyotb+WJRNlrvtPQGtaSwDUuyaBk1SOF0VuWfcSiX+AYa4o6C5Uxyv
	a3GWaHp5pGzyptltO3VxaGHXP3qANgUyybXZT4q7KvwUVMF/pe7A4CL+tHBWaEro4njU
	O0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=E3EhNBV7e8BNooomocGJNns1MUJVyBJhOnBV3saw+9U=;
	b=QGMk52YJUMRGu95Uhmr7Lh0y7F8ndjXEcriEr1gzlkVQi+nOAkGcuHJzD+tVN06UPQ
	KencfIlvCd1RbOVyOfoRD/K8mH+zaJsLrCb2etidoBfZl10VE8YGhj2fxNiQ1VuXXvma
	sytxZRj24AIPubmjKOICgvr9ryxRQlWo8dmJFYU+MI2vZAUTg8aID9DkQg0TLRJKmWM0
	fyyixtsDDQL+kY3DSnr3QBHnegY0cK3Gf2k4TJL65xvWBhZ3l0J2L7nrzAyngQ4GrLVR
	A8tvPfNQ7RPT4V9HhjBh6Va0t9uI1k6Zs+EU38Zrj4Dq5cNZxIJsBJ6AyLOlk9zolOlt
	lfRw==
X-Gm-Message-State: AA6/9RkI5EhRp6vLlDTiG/NQdBSI8MK+90G3KyiLm9wnNGOsD+BoVrre0XJ23ILP/h/hHA==
X-Received: by 10.31.131.211 with SMTP id f202mr4538867vkd.7.1476365180373;
	Thu, 13 Oct 2016 06:26:20 -0700 (PDT)
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com.
	[209.85.213.45]) by smtp.gmail.com with ESMTPSA id
	127sm5207630vkj.16.2016.10.13.06.26.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Oct 2016 06:26:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f45.google.com with SMTP id 83so54185460vkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 06:26:18 -0700 (PDT)
X-Received: by 10.31.93.198 with SMTP id r189mr4522029vkb.39.1476365178632;
	Thu, 13 Oct 2016 06:26:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.120.78 with HTTP; Thu, 13 Oct 2016 06:26:18 -0700 (PDT)
In-Reply-To: <1476188934-17044-1-git-send-email-ross.burton@intel.com>
References: <1476188934-17044-1-git-send-email-ross.burton@intel.com>
Date: Thu, 13 Oct 2016 10:26:18 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrv_GjFBt+TBX3Vt_JxRKTsm___qOApq7euZ45CByEWdQ@mail.gmail.com>
Message-ID: <CAP9ODKrv_GjFBt+TBX3Vt_JxRKTsm___qOApq7euZ45CByEWdQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: also set CMAKE_FIND_ROOT_PATH_MODE_PACKAGE
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
X-List-Received-Date: Thu, 13 Oct 2016 13:26:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 11, 2016 at 9:28 AM, Ross Burton <ross.burton@intel.com> wrote:
> The other CMAKE_FIND_ROOT_PATH_MODE_* variables were already set to ONLY, but
> PACKAGE was left out.  Fix this so that cmake doesn't look on the host for cmake
> modules when it should only be looking in the target sysroot.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Tested-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

