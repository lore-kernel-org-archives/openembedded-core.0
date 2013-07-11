Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id D97986AE90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 08:57:33 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so5557461eae.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 01:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=YFd6LFTS81l9bj97AaWUnI5XICTuqgCHLTub90/n4Fg=;
	b=dsbkkiunuFZ76E9VYlL+s7C7/OE14r8a+q78ZjLB9qHeg/Y5H/P2KrEK+IdFs7mxIT
	PVFDaPcsN+By2Fk3FaZbDzR2lzpu3Ppc+5NhSZOuQmqefg4qy9QFqamZLxEyd3hgPzI7
	TJLfp9OHDp7c71NiyntHq4fQnlZwvtqXn7UfqWtWGxfe1WqZj/bhSLWvah/Ue82NLLo6
	tbvlVKEvCWpgFxZbHzfPBo/S1iqK+DKJAzqUSvgPYbbWid+VCq07cLDFkilWh7QxW33I
	N19WcmNVBCrk4uedLs3PrnXHaTsBsGOT4mr+svPGtD4KaeUKLNT4CgSvtCTcBqxTQxae
	mghA==
MIME-Version: 1.0
X-Received: by 10.15.102.68 with SMTP id bq44mr40746774eeb.89.1373533053814;
	Thu, 11 Jul 2013 01:57:33 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Thu, 11 Jul 2013 01:57:33 -0700 (PDT)
In-Reply-To: <bf65f77f194b7e5a9047a2196e87a2d59f8e0e6b.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<a9d90af766913d932c03bc57e395bab720cfbe3c.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
	<bf65f77f194b7e5a9047a2196e87a2d59f8e0e6b.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
Date: Thu, 11 Jul 2013 09:57:33 +0100
Message-ID: <CALmOhgnPu5RGZ4iC+C3XjdbD6rT1OKwfy0Q_ATPLqH2o0uVZhg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
X-Gm-Message-State: ALoCoQk4hZI1YUoCkjkQ/R6T3M2hWJbDxSyRcUCh+Y/4yevw5hQEX6Q7OL4KGdGvtD6a7Llynjlv
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] docbook-sgml-dtd-3.1-native.bb: Add real PV inside the recipe
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
X-List-Received-Date: Thu, 11 Jul 2013 08:57:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 10 July 2013 16:07, Emilia Ciobanu
<emilia.maria.silvia.ciobanu@intel.com> wrote:
>  PR = "${INC_PR}.0"
> +PV = "31"


I thought the general trend was to move away from real PVs to the
autoincrementer? I'm just curious to know what issue prompted the move
back to real PVs?

