Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 659596074F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 21:54:23 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 14so6475572oth.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 14:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CGN6kS2ny5sxMXJfiAY924b/1NDHBvKmafbKiz7np08=;
	b=Hz3+jJxmkBYkDlLZKMkm9uIklu/iuufc6sVgXq5Tt5XrIXWwZuPvk0ABVLe62FZjSn
	T6X1BMPfXPMh3FAkcKIpi+C0JMilAbibhgrrMh3FNSIdppX2UwiTqo0WUbf0IHMkmgVS
	2N/3D13GQMSABlYwbq2dfD/WUMkdZPch41Cdp5bnPfAXOEBlJvPbnLJeOu4NxqV1fUsm
	WX2jgfA8UpFGo1gyIUJKJnDrNrctJuU1ZP9Ds5La1H0JtxDdbaePHQpXQegO74pYb9Cm
	7wCFYCoDY208Ieh9TKkcdUgkE8Se4h52blZE2w78g41Mi6CqeKoDt1NX9LcMoVceZTIT
	BhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CGN6kS2ny5sxMXJfiAY924b/1NDHBvKmafbKiz7np08=;
	b=c7QzQKyE7ifeYH4Mk4I+fWuQ3GBiDulgLz2Cr53qHoq5CNE64jlg99KvKErwmeYuKS
	n7u3MGDE2RRVijBB0uusmI1lesYdY32L7wFcfZnGhlbqRalrQoUyh+Tne4ZKjxMSvG/k
	Zt5FHeIhlwzf+5LjEzcKA74IZoH0Rv1ZxOAZXtkTosg4LT9LSjgLdzON0KfII340yxdf
	5mqk6FpFkRRNfdgB9i0bRz7qNAm/VKeJpGNVftu6xg40aFwLHp8r+kQ05+DAWp2HbMQo
	HlPUnpWD2UC52ImTVm3sDhTnyudTR6pAexvETkOCiYQlCweuosF5lgFMWUZRRw89P3EE
	YAlA==
X-Gm-Message-State: ABuFfohLVt6jdatR+DnKY/XO32XOcbKaBkvvtEB+WZuwQU7kiXQddV+4
	T4fnFv1dmw5F6xFW4zX8i/XxeA5RvnI1WGMJVlL5rg==
X-Google-Smtp-Source: ACcGV62LIkdOHGcGLVia3YTwQiPpwvo9t2NXCWKHFJByhah5E2gis6quh4z62WskUfYyK9DWlBNvkl5n0wjoLOEGjpY=
X-Received: by 2002:a9d:30ae:: with SMTP id s46mr2386402otc.132.1539294864184; 
	Thu, 11 Oct 2018 14:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1539182705.git.kai.kang@windriver.com>
	<5738e481e2638087e03770997fce2c4e6c313061.1539182705.git.kai.kang@windriver.com>
In-Reply-To: <5738e481e2638087e03770997fce2c4e6c313061.1539182705.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Oct 2018 22:54:12 +0100
Message-ID: <CAJTo0Lb9U7M7c2Q=RaAR7ctXvLztTTLJjxTL_hwpzfF4USJudw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gobject-introspection: add required python modules to rdepends
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
X-List-Received-Date: Thu, 11 Oct 2018 21:54:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Oct 2018 at 16:48, <kai.kang@windriver.com> wrote:
> +RDEPENDS_${PN}_class-target = "python3-pickle python3-xml"

I'm pretty sure this idiom isn't right anymore:
1) python3-native has the right PROVIDES so e.g. python3-pickle-native exists
2) the RDEPENDS are needed if you build
nativesdk-gobject-introspection but this doesn't add them

Ross

