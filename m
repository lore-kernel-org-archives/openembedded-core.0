Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f45.google.com (mail-yw1-f45.google.com
	[209.85.161.45])
	by mail.openembedded.org (Postfix) with ESMTP id 135CC601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 09:55:18 +0000 (UTC)
Received: by mail-yw1-f45.google.com with SMTP id v199-v6so4912320ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2018 01:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=E6BbCJXnPNkwNd6Pv9k7X0Gs35HyezfH1Ck7cQzLDP8=;
	b=JTnyQ6/uBLXb1/kZ+yD6stFCZNcswqNgIR78stjHK9Ta8yzWuMAxmxrcUlgoOoKdUD
	16ObZnT6D8QdkBVegmglI4e0h0yzdgQIX1/+HfJz5/uwNhHjZE20xHVaYgdTUA5QPhO5
	C4IaUTMtzR2dWivSO6gNl+bW8DW1Bey52PpgvpW9r4OJZ388UQMIJ7uiXBfYrcUhC7Ly
	gBHXPK+0R7/WfOMjVja9mVaQT9OTMI211znxMf3cS/rdbuAM7+/FnNMrZOYEBk9hyfYb
	Z0Lb0LoQoYqVRJoiAzdX2PNDQwanmXIR0b28v3yKc/z9r3n8SPEhQbmJq9lS9cr07egt
	U1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=E6BbCJXnPNkwNd6Pv9k7X0Gs35HyezfH1Ck7cQzLDP8=;
	b=dif34zBsvMP4eVIwXOMHCQhcUD5ej1LekVVOLV1/H36UI11arH4PDEUoSMRJDw2BTn
	A99Caeh2MErYi0T3gjbDBCEfzSwZqMuXe/V/0QDOQ6dd1bopD1I/YKI235nlNA4zrDlQ
	xga2zQsEuFoP9uPwPCr2iFFcUqlUEPeQ3DEwn0RZcjlEnLiKpCeJaAj4N2vy2OknHxJu
	3uN3ufEAsLwBL3GPGndW/MWanQTBTuuR0kFslxe4qGFzsy89YKWTgxV+qJ1PECv/nm9+
	jQ4A0IGWrlTqJhxTPXxQVofMxutXmpLM93kSRRWFiw2VGC+Z+VQhcPNZziN8hnjKJmR/
	T7Rw==
X-Gm-Message-State: AGRZ1gJ3SLwLc2W+vTmREoHwbPNZiMK1Mw+a3n3ZK92QOgcplybcsIk5
	soFOWln2bnXabfxOen41R7k/k7twBeN5lA/6jo1zNIuE
X-Google-Smtp-Source: AJdET5ct6f7zJKz6+1sxVEr649KX4qfiWIWYZ353TBEZfjOau5w80FdxoLfKVq6NZS6iUF/bVdVtE5s/NemCCLJ+Abw=
X-Received: by 2002:a81:7457:: with SMTP id
	p84-v6mr24085240ywc.401.1541498119388; 
	Tue, 06 Nov 2018 01:55:19 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 6 Nov 2018 10:55:07 +0100
Message-ID: <CALbNGRRtXDMPapV7Xo=dMfMhBWJBxX_U-JWeEmyPb=CYqzYTPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Strange issue with symbolic icons for adwaita-icon-theme
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
X-List-Received-Date: Tue, 06 Nov 2018 09:55:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I first noticed this with update of XFCE's thunar: From thunar 1.6 ->
1.8 the icons in toolbar changed to 'symbolic' variants and there are
some icons missing since the upgrade. I opened an issue at XFCE but it
turned out that it is not an issue of thunar [1].

To debug a thud based XFCE image was created with:
* adwaita-icon-theme / adwaita-icon-theme-symbolic /
adwaita-icon-theme-symbolic-hires installed
* KDE's breeze-icons installed
* gtk+3-demo installed (it contains gtk3-icon-browser)

Without further modifications starting gtk3-icon-browser and move to
'Symbolic' results in:
* no icons displayed for adwaita-icons selected in XFCE
* icons displayed properly for breeze/breeze-dark selected in XFCE

And now the strange parts:
1. After deleting '/usr/share/icons/Adwaita/icon-theme.cache' symbolic
icons are displayed properly in gtk3-icon-browser! Recreating cache by
'gtk-update-icon-cache-3.0 /usr/share/icons/Adwaita' makes symbolic
icons dissapear again.
2. (With caches) Starting gtk3-icon-browser with breeze-icons selected
in XFCE and changing icon theme to Adwaita while gtk3-icon-browser is
running, shows symbolic icons properly!
3. Starting thunar with Adwaita (missing icons) and selecting
'View/Configure Columns' opens a dialog in which 'Move up' button uses
go-up-symbolic and it is displayed although missing in toolbar!
4. Googling for this issue does not lead to any hits - seems PC world
does not have this issue - on my Fedora PC gtk3-icon-browser works
without issues.

Some guesswork:
Looking at symptoms 1-4 this 'smells' like some race on icon preparations:
* For 1.: Icon loading is slower without cache
* For 2.: Breeze icons are svg - they might load slower
* For 3.: The dialog is much later in application's timing
* For 4.: PC have a much different timing than RaspberryPi

Sorry for volubility... - GNOME experts wanted :)

Cheers

Andreas

[1] https://bugzilla.xfce.org/show_bug.cgi?id=14443

