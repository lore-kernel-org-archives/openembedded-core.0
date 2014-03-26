Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5EF6EE45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 17:03:35 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id 63so1217244qgz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u2LK+ON8tQpCxTGKoZgkhobMTJcrfhK/JTlpu94fHkg=;
	b=PujXNCt7CQop90BU0wkYgEsQdYBWSsC31FoEj7/9zZ48VmJOYq7EKXzOHBqXH63RGx
	xDFMYOJXACN6H0rKjMUcaqGNGaTPP3LnMJn2Sg3dtC7go/SZU9X5WNnxT+xyybOMW+P1
	65miqQ0D3xXAaqtbt3syFg+hrmbPyDoJzttiRSN5XR1JYv+4QWk6lZKhN76EW64sDE2W
	/s/Dk/vrWWHukvs1MuvDMRZ8qd0gcc4tq0mSSDziR9LP8nEtHHxLdxBNaHmSidLbqO59
	xgYaF8LlgCqBnalMv1rg1RARoOwinvB8lXqE1v7mEqMf9JjKqVLMPnbokr+c3ZhdjDr2
	rrFA==
X-Gm-Message-State: ALoCoQnIfKDx8T07zPg4VzV+o56LqxxiHtZ3g93mkC9RrUJl5TgyCooHo3KNYk8Yf7H8GdMC3GgQ
X-Received: by 10.140.81.112 with SMTP id e103mr3641406qgd.99.1395853416129;
	Wed, 26 Mar 2014 10:03:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 10:03:16 -0700 (PDT)
In-Reply-To: <1395844085-9929-9-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<1395844085-9929-9-git-send-email-lauren.post@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 17:03:16 +0000
Message-ID: <CAJTo0LahPOOx1NrmkfNs++by93kX5uY24ga1ES79Gu7Mf8OsUQ@mail.gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] gstreamer1.0-plugins-bad: Change PACKAGECONFIG from bluez4 to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 17:03:36 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2014 14:28, Lauren Post <lauren.post@freescale.com> wrote:
> This allows easy transition to bluez5 in future

I'd say that whilst you're editing this file the duplication should be
removed, but gst-plugins-bad has this in configure.ac:

  PKG_CHECK_MODULES([BLUEZ], [bluez < 5.0],

So no, I don't think this will work.

Ross

