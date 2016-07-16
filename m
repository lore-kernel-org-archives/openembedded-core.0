Return-Path: <jacob.kroon@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 08A4560670
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 11:39:16 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id w143so11536994oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jul 2016 04:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VE4Yw3eR/9eNzlVtIUywKPa0zXBN4E/v0qv3RaZs+D4=;
	b=ygoV4PCpIh+UVBNjViHb1tFXLeu2RmuToSfNBBATfIimStsWVMzFI8EGpv9KFd1Xui
	yi5gVjtZZTPAZkc1p8AbDKMbtJalGYzGXdF8ZHTQAUFZdBmkmefia1oGfqgkwmIYvfMV
	d/ELEYe8lObEfdAYb8JbKy1SsgINVmKvnZm739hmYCDcF2L9NFcmLOwJo1uhjZD+UWrA
	K+1xuZAb3zhKUVRXiCnhe62KMj5QLq8YiagKVirVSVi4EhsQKtTEpU/Uzi+kszE4WQFJ
	Oj66wm1t3uUZ/FDnc/y5BEUuMAEW9zvgAwEij3GzdzVHLFbL12L/jYSVGTDKiAcfO9dW
	rSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VE4Yw3eR/9eNzlVtIUywKPa0zXBN4E/v0qv3RaZs+D4=;
	b=FC2qh4tspJk5KCNoKYEo08FP/tYaYYE7/N0U8gn6RJhPuWpe3TWoqN91vF8mRkCHWe
	U/PmrMqhmrRPeJhsfKmOCAWdyWQv9EPF0e8MQMlCfCJb0SFbjNckoOjauJ/JBH1aH/A+
	glfXnXWmbsYDG62mkJc4NmEaGILak8KqxkklvxyE3dU51ivAQUV7x33SqGRprT3O6RV2
	AqrHKGaW/NJ+/EKnZYeBhD6dXyot1oizuq5WFcH+ltvVN2vErlUkUGFuh9VPvOiorY3X
	7LLgoqCvRJ1Oc1BbGFDIOgjkrwxse8rR8C7hRbCsk6n5AL5ZxnDU/TKnamYRHXBibPBD
	afBA==
X-Gm-Message-State: ALyK8tIV1uQfaiPBLsJhn02Es7jxSdtcTokMclh7ommmwdkdqYR/zkQugg4yikJpTbGWmZiPX71YfNbLYoS7qg==
X-Received: by 10.202.220.135 with SMTP id t129mr619559oig.31.1468669157362;
	Sat, 16 Jul 2016 04:39:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.24.71 with HTTP; Sat, 16 Jul 2016 04:39:16 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1607160640010.4510@localhost.localdomain>
References: <alpine.LFD.2.20.1607160640010.4510@localhost.localdomain>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Sat, 16 Jul 2016 13:39:16 +0200
Message-ID: <CAPbeDC=_E81fHPnEBkeEz4qpR9d4bjpMqqw8F0evyD0bCKOkxw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there any reason *not* to use musl C lib for current builds?
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
X-List-Received-Date: Sat, 16 Jul 2016 11:39:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 16, 2016 at 12:41 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
>   as the subject asks, are there any compelling reasons to not use
> musl as the C library of choice for OE/YP builds? just wondering about
> any potential downsides.

I wanted to use Musl for some real-time experimenting, using master
from a couple of days ago,
but had to switch back to glibc due to missing support for PI mutexes.

See http://www.openwall.com/lists/musl/2016/03/18/6

