Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SuMPZ-0006ET-4t
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 13:39:21 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 04:27:49 -0700
Received: by ghbz12 with SMTP id z12so1646104ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 04:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=uPbq10/uUokwxf/G3xfOYrNL9K+fwg95LUGouacINm4=;
	b=VlMossn3aKLQ+OhMIOHRENrfoj+ogEC00uyuLMa8i6865hV5Gyz8m4HQ4fodfftYPV
	+LVdGWH1nuR6f+uIowaN+C05Z1KJG7Pwll8K8x/m7VaD3SYF1GbaHKZXGYTk9j+7hAtS
	TsBllEpgHJaI/p/BcnFf5IwWWbGa4n37tWwsjMOyRylLqvAfYAzhx5E3aHmJIX84AEF3
	0MmemCI4HjtYGKPQURPfqLq9h5CA6+cDDdWsz0HTX9ynTPz7PJncePVqJVxlKLWoEGVH
	LmrvLngKJKgqF5uwlWq5X+/Bo0V25g4sIZHy3qNbDh7hXGOqvUijoi/FpKUYyk6rmtxb
	6LbQ==
Received: by 10.50.100.137 with SMTP id ey9mr1275102igb.61.1343302067909; Thu,
	26 Jul 2012 04:27:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Thu, 26 Jul 2012 04:27:27 -0700 (PDT)
In-Reply-To: <50112207.3060709@intel.com>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
	<50111C7C.8080904@intel.com> <50112207.3060709@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jul 2012 12:27:27 +0100
Message-ID: <CAJTo0LYeKt+KypnrVq50tSbjqfK8XyvUnZp0xvz=KRmMx7dXzQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnonSiJzci4g2P7uGjSI00e91AXQDEw96+k6yCtAfUUCQ3ghGtg2a7nKwhp2+Ud9rTr91n+
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 11:39:21 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2012 11:55, Radu Moisan <radu.moisan@intel.com> wrote:
> I see no build-time dependencies on dbus-x11 (only runtime dependencies),
> so, assuming PROVIDES is used at build-time, I don't see it's point.

We've just removed dbus-x11 because it's pointless, the provides is
only for compatibility.

Ross


