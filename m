Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 92A796B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 13:41:11 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id wn1so2005632obc.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 05:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=XwDg9nsS76eGpyqvycz3tyxTm0cyTkfbgbNnLYNpLC4=;
	b=ltKuEhkGEA/sINAP0z+uvnrXyL0XlZf4LC+J5pDCId9OsR5/LKVQa3gVGHnt+sOMWp
	lfZlJ3kKldrFJqE6qdmLjnhQT4HcA88Q0EKZvvnn3/cgaeeI6kJCqteGXU1xzKwc6cxi
	v8d8N4oxlQIMctho++R5J+NVXNXktBM/wNBTSlC7FOtepLT0nM1o0zkcCzau7YgdyTy+
	iTOAwAKpifq1RcrqCqUiR84Q1jZ94utn1Y9p6q0HDtGrvHxrS8ESvWi1dkF8VXQ3ijPU
	FkRgds+vQnqiLQsiSiTqkTzdRcA0fis1l8m8c4nHoz8Ub8kmEng9oDun8kVi1HScI3LO
	jBpA==
MIME-Version: 1.0
X-Received: by 10.182.28.134 with SMTP id b6mr6694570obh.27.1390484472370;
	Thu, 23 Jan 2014 05:41:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 05:41:12 -0800 (PST)
Date: Thu, 23 Jan 2014 11:41:12 -0200
X-Google-Sender-Auth: DTJyZLqK9Z_CxZkyHvKQtUw67Ws
Message-ID: <CAP9ODKpdT9yypcEReFj2mDuL4UEuj5_0xOOJqnO4Q3qfS=NcdQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: update-alternatives WARNING
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
X-List-Received-Date: Thu, 23 Jan 2014 13:41:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I am seeing this:

WARNING: The recipe opkg-utils-native is trying to install files into
a shared area when those files already exist. Those files and their
manifest location are:
   /home/otavio/hacking/fsl/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/update-alternatives
   Matched in manifest-x86_64-opkg-native.populate_sysroot

In todays' tip.

Is it a known issue?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

