Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 675066F588
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:25:21 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id va2so2886948obc.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 09:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZsNbzYcyB90+btu6YXGmbZvYi2z7oDJVNoIEf061o1k=;
	b=TVwlYJrY0xzjwpFKlPkqo3ReGmeK1huw6GxUkmQ0I/JloD19qJRB7/xLu0N7hLSqNl
	Ty/lZOZeCqjQsrPASWPA8KY+6YkoSPyObWjKt1PO47vuv8V2K14gWrrDv1HNao5wgHQH
	DSG+LPwU0O7SnLA5l+9kLxJahySxWZsy25XdXIXmkOEMeqsnaWadRT8tOdLI6KZPUPdL
	kiUOQ5uYWiDzCRDnRmvmnJ22DSTnlM0yAOPUYNlmfRSdfQrHRbC5L8MZvbw86fkM6XyK
	Kv/eo3VKepBz2tA1qAuqiM8IEctpUo7nFROVfa3lJZb7FkSwaIHJQcAHXGDBAJ0yz2Qw
	N0GA==
X-Gm-Message-State: ALoCoQl+RHua0A7Z7RO84E5rd6GH3q1SvfMAwTQvxtJ51rtQVamxrY0l8C31kEIjLRyFgjNMPvFa
X-Received: by 10.60.15.38 with SMTP id u6mr2936428oec.26.1394126722535; Thu,
	06 Mar 2014 09:25:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Thu, 6 Mar 2014 09:25:02 -0800 (PST)
In-Reply-To: <AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA4CA@SJEXCHMB06.corp.ad.broadcom.com>
References: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
	<53165C2A.10403@linux.intel.com>
	<AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA4CA@SJEXCHMB06.corp.ad.broadcom.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 7 Mar 2014 01:25:02 +0800
Message-ID: <CAP71WjyrU5Fyb0+ocAkUt-f=4j+YCWRqf1GA1t0eaVDVNnCiFw@mail.gmail.com>
To: Andrey Belous <abelous@broadcom.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Thu, 06 Mar 2014 17:25:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Wed, Mar 5, 2014 at 7:11 AM, Andrey Belous <abelous@broadcom.com> wrote:
> Yes I overwriting more  , but other variable already with ?= and allow to override them

I think I am okay with the patch proposed here. i don't see why the
late assignment is missing just for this specific variable while it's
used for every other variables and in the eglibc include file we
already use the ?= for virtual/libc.

as far as I am concerned, assuming the commit log gets rewritten
properly, you can add:

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

cheers,

nico

