Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 899DC605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 10:07:18 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id w16so5652548vbb.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 03:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=IXY+/57Cv0s+HaKqatVSxYZWgGPLhssBADhtoUCOR9k=;
	b=lPRsc7o5Plz/BjR5gWnO29AzE7DDlg0IfvPtdD/UOru1RrGYnj/19QpD36ReaQkiy9
	btAnmKC7WhBxhHKPmnElKoVOEwm7UoQYzZk2aAVbcUzoqs/5F7AmXJg+d68R7mD2jqTw
	H4meWXPbohZg4HJBrQkHqVJqnOnXzA1lsNZAXieAIBNCekfGj+535GTbJ/n2vfNTIAQC
	VY2H54FaqckWrp4LQu1e4PRrCWsVbD0wvJQ6QkFfNIFg+olpJcPVXw0DNGP+uBE4ao5O
	TVpL2YErwomaWHV1ZU0iEqyNZiTN+zEk6tSFUWjmenzlnvfoICs1dlQliPkZx05zAngf
	0JLg==
X-Received: by 10.52.21.232 with SMTP id y8mr4321643vde.6.1371809239335; Fri,
	21 Jun 2013 03:07:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 21 Jun 2013 03:06:59 -0700 (PDT)
In-Reply-To: <178fedbf79c6a303d0db3ef7af6b1b81b6b3342a.1371781463.git.jackie.huang@windriver.com>
References: <cover.1371781463.git.jackie.huang@windriver.com>
	<178fedbf79c6a303d0db3ef7af6b1b81b6b3342a.1371781463.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Jun 2013 11:06:59 +0100
Message-ID: <CAJTo0LZ-Q2CTJomTKexEatwa77CyrJVoTHscZcCimDRpvA8+cw@mail.gmail.com>
To: jackie.huang@windriver.com
X-Gm-Message-State: ALoCoQnoTyQPMoNwyVlTMqwZUrksk9XJQtKuwW0YlGCuKdNVhv9flKeXbQOHX+TbNVM/z1zozCMs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 v2] libxml2 CVE-2012-2807
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
X-List-Received-Date: Fri, 21 Jun 2013 10:07:20 -0000
Content-Type: text/plain; charset=UTF-8

On 21 June 2013 03:28,  <jackie.huang@windriver.com> wrote:
> +Upstream-Status: Backport

That's not strictly true.  Chromium has applied it to their in-tree
fork of libxml2, but it doesn't appear to be applied to libxml2 which
is what you're patching here.

Ross

