Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id BA7B27042D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 13:55:01 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id r5so7880406qcx.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jul 2014 06:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XU4r9dQGT0N6T7iUNp71joF91zCDtwKijx7OTeBETq0=;
	b=FNqbpmzkmRJg3MaU0I6xVhcaVJFVDGdsHskc2I5ypS/OpP3kYLHJw+12I8N+mQLKn1
	c3s9SqMafcr3cVZtUfh/N9v6fxslVgKAus9+nfwCeMXPsd5vj+BrHLSXYJnXKlH8yqzG
	J+lkRs0atcTGtVWKLFFVlkrSTl2NkG1P2dWs2zqqSp3ie7Yp50hrA1/kIJHKmQCWesud
	ksnuWFq6pcYGBfbSRAwz9ZJheFdCltr41dLpeUznwqNBz1fVgW2vz8h0NwgGIcewrGbg
	PwN3eVrrd3JyBud7zewUMKSHmyEp3gpoBI1RncSyO0f8GgcNLcJm3Iji5ZEiBZPXfAbt
	A1ag==
X-Gm-Message-State: ALoCoQm9FaAzeYHhJEbraqD20OhRLXI9hNwmlje5KcgVVzXDFlMK4kEdBSu1ixpaPBNqBoqOmHfu
X-Received: by 10.229.82.74 with SMTP id a10mr1383871qcl.21.1405000502156;
	Thu, 10 Jul 2014 06:55:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 10 Jul 2014 06:54:42 -0700 (PDT)
In-Reply-To: <1404981454-20330-1-git-send-email-daniel.bornaz@enea.com>
References: <1404981454-20330-1-git-send-email-daniel.bornaz@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jul 2014 14:54:42 +0100
Message-ID: <CAJTo0LYLQgvoOAAPVaGA16ZSwWFWV+Th51VjPn7QuNaeyX2Bpw@mail.gmail.com>
To: Daniel BORNAZ <daniel.bornaz@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dbus update to 1.8.6 (CVE-2014-3532)
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
X-List-Received-Date: Thu, 10 Jul 2014 13:55:01 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2014 09:37, Daniel BORNAZ <daniel.bornaz@enea.com> wrote:
> Version update for fixing two DoS vulnerabilities in dbus-daemon (CVE-2014-3532).

Please remove the old version when upgrading, and ensure that -M is
passed to git-format-patch.

(also, no need to cc yocto@ for patches to oe-core)

Ross

