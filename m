Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id DB0EC6E8C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 10:45:24 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so612464qaq.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 03:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8k09Cc0d83MKxhXsaiJMfnxSg8hHgs9vCR+inizJV7g=;
	b=CAjmw+QtyW7gNXt9fbLxYjHJ2A1TF4PWde9Qf7sBkVBIRRhVSTczH0W8TkJX2by/Vi
	McRIS/0OSY+sYJT1+RCfWOOoCyYy4T1djXbQnGEGNWaxfE+F6oxLZy+4vPjveid+WrnK
	SoD4aF5LlloCcwOJB14ZloaEXvJPP3w6DCg6qj/4HTbIRIpX1eqFbkdBlLbLPwdmIfIs
	Wv9z9jwxZwNy3rKOlpEUDuPpVxPF+r2d5RKfmdPyzSFSnTzGN44ft75Y87YISgcbCqQK
	KnLOnVOYjswXzuRNEh374DAbrGlPlwyUN4icI0VS+RJmENzDuaqyNQ60GS0g4qtsH9wp
	0KmQ==
X-Gm-Message-State: ALoCoQkXmkTbgOfEvDxN2VBmpaEU+cBB/NvdCMbeW/dXOMz0GPIZbdSJhkGhIFQNjIGxsGRtsf66
X-Received: by 10.140.106.195 with SMTP id e61mr46233552qgf.66.1395312325021; 
	Thu, 20 Mar 2014 03:45:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Thu, 20 Mar 2014 03:45:04 -0700 (PDT)
In-Reply-To: <1395285985-13867-1-git-send-email-lpapp@kde.org>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Mar 2014 10:45:04 +0000
Message-ID: <CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 10:45:27 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
> +PEER=127.0.0.1

That doesn't seem like a very useful default.  We also can't use the
NTP pool by default, so this should copy the behaviour of the ntpd
package in meta-networking and default to no peers, and not start if
none are specified.

Ross

