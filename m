Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3768D78644
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 12:06:26 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id 18so10309450oty.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 04:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=9oSiOEqIXD3M22fg6lU5Hht/psTUkgDb691A4VRQDbw=;
	b=gUq3GLvIVvLGXA7LEDV74/qUz62m+n5eup9znlqvSt50v080tEazp+ljeJZ2f1jHkt
	eBKOt/+zwBNLOkr+rJiV7hgNSusvSfxgwQkSaNjUJsHmcyi3VJKM/BiFPX6UYq+JVvV+
	ffYZTpT4FETMXULrxcgBjNfiE1yySmdYCVF/Sl9mmrxeo0OsIrAza9rxoWbsbEPmURYc
	bxaZvizId4EED/EJAjVA8sqOdGKuCEXnJkaPN3hEZorsjs2gCRHr3bRqgnji3uA8ojpV
	IElTChYfE/B0R/mMiEMiNzlTPZdtRRyF+qbs7YAEEd4wJfI4jN4Fsui8JvupTGWRbiK6
	ggaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=9oSiOEqIXD3M22fg6lU5Hht/psTUkgDb691A4VRQDbw=;
	b=VxMugen91pXyJjUV7l3B5IUP5V1KVn1+lfiiwRTkDcPEfoaIrsTuLYnu3e6sEANpXN
	4dwZb/tZCe8cofhoPBySgl6n/OxlgjttJpvbZszhwpHaVyw0KZaNDTYD3+TDfPX84foy
	gaZrQsQR3R/ugATChNc/K/QO9X1/x1GoUhUGUu29CQJ07BvzhJqoGnP9asGbe0g6KvHp
	OYxrhW9wSa8GssfRhN6+usQLXDuis09oqGhg5EsrDVsvJ0378ZkxaqYO4TJf+rYbXs/w
	qyM1YlCKvHaQffVxLQKh18iK7cBSfbbPd6LnKxvH4T4qVQdpZx6nlu2GjkXDML6Yjanu
	BzJw==
X-Gm-Message-State: AJaThX4EuG03Q5AitLCDdpYKqdM3JJdL9EtdpDLZEDRQGc9j8iy4D0S/
	ZthzHjeCj+Lz94yTOvI3TRZFVKXW
X-Google-Smtp-Source: AGs4zMYkQZLu+8JuvOmxlxD1y5yMUMkCpF1Dl5DtrhDHeMWjF27crTHEVw0/uSzhMXZdoUjzCSEdHw==
X-Received: by 10.157.42.228 with SMTP id e91mr10416041otb.372.1511265987884; 
	Tue, 21 Nov 2017 04:06:27 -0800 (PST)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com.
	[74.125.82.181])
	by smtp.gmail.com with ESMTPSA id t27sm163615oij.32.2017.11.21.04.06.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Nov 2017 04:06:26 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f181.google.com with SMTP id o23so10324815otd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 04:06:26 -0800 (PST)
X-Received: by 10.157.80.13 with SMTP id a13mr9930594oth.370.1511265986161;
	Tue, 21 Nov 2017 04:06:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 21 Nov 2017 04:06:25 -0800 (PST)
In-Reply-To: <1511251487.5979.54.camel@intel.com>
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
	<3126cc0be3fdcd228a3bc73e2e58b90447c53ef2.1486668313.git.jussi.kukkonen@intel.com>
	<1511251487.5979.54.camel@intel.com>
Date: Tue, 21 Nov 2017 10:06:25 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqxbnkpimHmdoYEax6Njmxfcf9KVJazzvpgn=QzRWPc4w@mail.gmail.com>
Message-ID: <CAP9ODKqxbnkpimHmdoYEax6Njmxfcf9KVJazzvpgn=QzRWPc4w@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: native CA cert bundles (was: Re: [PATCH 3/3] cve-check-tool: Use CA cert bundle in correct sysroot)
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
X-List-Received-Date: Tue, 21 Nov 2017 12:06:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 21, 2017 at 6:04 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Thu, 2017-02-09 at 21:38 +0200, Jussi Kukkonen wrote:
> There is https://bugzilla.yoctoproject.org/show_bug.cgi?id=9883 open
> about some aspect of this, but it doesn't actually address the
> underlying question about what the right behavior should be. It's based
> on the assumption that libcurl-native should always use ca-
> certificates-native.
>
> Thoughts anyone?

I agree it should use ca-certificates-native for all native; it allows
for self-signed internal certificates to be added for internal
development.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

