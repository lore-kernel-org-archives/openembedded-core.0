Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.20392.1605451988549557153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 06:53:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ChVMZq4j;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id u12so8693938wrt.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2020 06:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=4zmhtGmJJeVTVBruonApAeSdxBPKgqkl3ZiyspC6GRw=;
        b=ChVMZq4jNrYlywa8rKGx5Kctcas/A/UZKEXo+bRCInZ5NSag2mqu89DNkAyellhKgW
         ieiA9Xw0JNE3I8WUAaDWSTllDyQvj9ypIeF/qhArr0DT2gTQRNySg4BEaOnJ7Dve0Ibk
         kRZoURl9sbpxIK153takSSMAA059nse+OcGCKAc0Rgw1JJQpdbh7cnwIUSixGQRFqkRk
         yF7R7AQMcbVd7gRQfkoNf5+LI9YRcvUbmPJyTzi9HoT/XnRkysBGeTjhFR6gqREd2kvF
         K1wnn7tp80CJd0hGfzyot/gPfSWiBl4uMxrUIm1c/nxhmKpIYobtLQDa1oUo4FeKUn4T
         g5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4zmhtGmJJeVTVBruonApAeSdxBPKgqkl3ZiyspC6GRw=;
        b=Ws9NCuvN67hx4z6qaQda6LRh+eF6NIJBsQnjgP/OL4YLHo3hCfYDVfv1pHEMUAuLEW
         +ZzH0o3eFq7+1RWi1NhNAdy4cfnQ39LhEdNc76KuxecTJAH9K8X3oBSdAcg3oFDbcstx
         m8NrtTb0nLBNmUPxz31a7O7TmY5/acYtHtnsN8XMUdP3x7xFjOhJT5rpr54IcqHoPqHY
         GkPDHBSeElRhyd0caJ6U6+0hiYTXiIUWjo3DFFUlA/iTVe78mjeud1kcHVc2Z46LkFI+
         1azL/gWZa0Z1oYZGdpbZK99LxfgTzL1oA0jKMmSAfV2mu1cOvRPWxXBMF0/PffNKVlju
         xlKw==
X-Gm-Message-State: AOAM532q346P7aMTOsqfkABJbTPEUwbnMD1Bhi4dR3s3+eCW16mBUFmE
	aPj5mrxR3RfbBejmWvb0FIw=
X-Google-Smtp-Source: ABdhPJznemZkVwNXyo6bTBxqZzhYhqMMYBc1y1CkCmlhHRm5/XLPD+ElwlkEdu+gXUmeaGyPPxrT1w==
X-Received: by 2002:a5d:6310:: with SMTP id i16mr14355705wru.284.1605451987018;
        Sun, 15 Nov 2020 06:53:07 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch (c-93-184-20-132.customer.ggaweb.ch. [93.184.20.132])
        by smtp.gmail.com with ESMTPSA id q66sm2147562wme.6.2020.11.15.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 06:53:06 -0800 (PST)
Message-ID: <63ffafbe277b2b6708b3eba02ad03e18aed4c5dc.camel@gmail.com>
Subject: Re: [OE-core][dunfell 02/18] ptest-runner: Fix license as it contains 'or later' clause
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 15 Nov 2020 15:53:04 +0100
In-Reply-To: <c0d1eb1efad160b7832abd87a168ca547c296d94.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>
	 <c0d1eb1efad160b7832abd87a168ca547c296d94.1605278902.git.steve@sakoman.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Steve

There is a nasty problem with ptest-runner 2.3.2: It prints an internal
warning for each test case, which got fixed by
commit: d3e9e5ebf36d1d1d7ee4bc38a64f6ec9e8fc819b
"Backport patch to fix inappropriate ioctl error"

You might want to consider updating ptest-runner to the latest version
by picking 4 commits instead of just one.

- ptest-runner: Bump to 2.4.0
  792d1ebba98b097d4d68c7261bf6af0c9d186eab
- ptest-runner: fix upstream version check
  5df6dc44370c446c699007659782323814a4d9ce
- ptest-runner: Backport patch to fix inappropriate ioctl error
  d3e9e5ebf36d1d1d7ee4bc38a64f6ec9e8fc819b
- ptest-runner: Fix license as it contains 'or later' clause
  744a463831016abdac3433db8ca9d1b656881915

We did this a few weeks ago on our local dunfell branch. So far it
seems to be the right approach for us.

Thank you and regards,
Adrian


On Fri, 2020-11-13 at 04:52 -1000, Steve Sakoman wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> The license headers are clear that the code is "or later", fix LICENSE
> to match.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 5f0b5cdfcb104ac50222a47652e090ad8770e49f)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
> index 187f22df04..3a0dbf84fd 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.2.bb
> @@ -4,7 +4,7 @@ program which loops through all installed ptest test suites and \
>  runs them in sequence."
>  HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
>  
> -LICENSE = "GPLv2"
> +LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>  
>  SRCREV = "7015e9199ce748c0717addeebe7a8c47448bab03"
> 
> 
We have been doing this without any problems for a few weeks now.

