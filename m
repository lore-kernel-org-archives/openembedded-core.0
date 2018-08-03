Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7D278E62
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 15:50:09 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f18-v6so6594758qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g7k1YKoidKkCskW0THZYgWQaL1AKEwU+K58DyeSzlbA=;
	b=bQ5+kDozCg6okpiVL5XgkGEBmF5oWVEOTyL7HKKeecutbwXz720YhJO/OYsGE3T5Mo
	0dWhalcmGZ+oIdEwVrovy8uSdXeN0sT3XeOKh1mGXreHBEqwSBM6QNC/5QLJ1RYG9mhc
	hOUojti3CInhgbGUBIE31NLxi5W5ctwM6bNYjxQZAf2DBiY1keVZQqFoRXGK3fNNdZFy
	LT4l4kwRo4THM22EuZPlEiez8oCM0p3q2K454FVRcBpU6UndvsAXdYGOonbGYLgJ5gT1
	fHoih4nulJFCFCY5qEwZBV2OYQyP/0EKs0cUE/hSM8lSfuqq2NAkCZfWlLzpJuRHJowz
	zYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g7k1YKoidKkCskW0THZYgWQaL1AKEwU+K58DyeSzlbA=;
	b=qMSL9N6Kj4l9mUr4GEFL9Pm+aFkpwy/Pvby/uiAXe9dhsljwTcvaxPPJwWsacoDMEF
	7oP+CafKI8RjhONXdTZkULOYVNufreIzyY31FNIChGmafBjPPtUWM0V7TQM37cBQLqqX
	QrUagY5auFUyMRZ8jGqlbD4HMt12YoPBLbVr0OQ1PgeKH1jGOl26EqZ0MRraOK097d/V
	HY6D2SMHw4WPxPOWFtJJWHspttPqTk0abqijyEQ5/SYol76/sB4MdJR9s55qgy5wG/CY
	r57ZB+B0oTfIMBNl4TdiQscmlfekNxpCvH8bSMb1AcYnujSJpy9IJUAQnKkaxpkMANJW
	DU2Q==
X-Gm-Message-State: AOUpUlFdrz3mKPp+cdell14MavKbE5exp25+F3drnuw30DIfWi3izTxE
	m4yKhUzGsawFXqqLviZLUnJAcXLcnSrHSkovOe0=
X-Google-Smtp-Source: AA+uWPxVoQzgbeaFa1JfS7yMtTzUBJEyYF2InbhXASr3R1xmFkIuRUwvZh8/eILYYYMBEbMNfhJJbBH+EJmE3TfwJpc=
X-Received: by 2002:ac8:70c5:: with SMTP id
	g5-v6mr2025698qtp.376.1533311410829; 
	Fri, 03 Aug 2018 08:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180727210433.1580-1-raj.khem@gmail.com>
	<CAMKF1srtPvMcUEiraSvL2Y2dTL5OVX_7SUeua-uMvz5T+LrPKw@mail.gmail.com>
	<2badc7bffd65c7e51a5121522e3c4105b4c97e81.camel@linuxfoundation.org>
In-Reply-To: <2badc7bffd65c7e51a5121522e3c4105b4c97e81.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Aug 2018 08:49:44 -0700
Message-ID: <CAMKF1sr+M+eD653my6oCt4EDCoSE2W6gc0Ximad4N-ktpXdakw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "gnutls: rationalise libunistring arguments"
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
X-List-Received-Date: Fri, 03 Aug 2018 15:50:10 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, will do. I explained it in original thread as well
On Fri, Aug 3, 2018 at 8:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-08-03 at 08:40 -0700, Khem Raj wrote:
> > ping^1
>
> Could you put something about why in the commit message please?
>
> Cheers,
>
> Richard

