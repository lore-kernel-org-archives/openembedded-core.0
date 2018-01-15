Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB5D78683
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 16:58:16 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id g21so12384553wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 08:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gz0maWONltau6uJKvA9ThND6Igzzxxek7eKp6dAm45A=;
	b=QiobYjDkK7h29BpPybw+AcfTGYn79kTycg62EigfyvYuDpg6Yl33Ov+LTItZTOKbWd
	KH6nmHNLQFLqX0xqn3onIQkvXdSIYfiCfeYZBxQfHLsv6R5ckH15f9cgo7r+ngRS04DN
	nWf7BUHoyukDEIJonSGgiAi6S/G/M9/xkOuM8GMmtUc5VmiDbZr2XOZtOlIdA503Ablu
	wsTp0LYeUAzrfO3/hUUhrAHrlo/Jnrn59OhQhi7N9NIKl+Wi90Vr6iRUS3f40UVO3OUl
	IJGWIvRYXgd0oSpjxoADpBbanQq/weBvwNx3EwqtVtWAYmMs0bm+sVlnNrX9zrHn1Jnn
	QAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gz0maWONltau6uJKvA9ThND6Igzzxxek7eKp6dAm45A=;
	b=KVBiSTKTASl9ZjqukYLlXdge1ooQy/tmQstVGpezrMJNh37ML2GBtdB/B8zaf6cc6p
	FN6/yBfJ1++mHSXo9mIDrgitPAAES75jPhTpc7WIPj16f2oNUfrL0LIN2HPzCSHVBboD
	GKMJS8wljlEEd2jwC8sskCp8/f7gXNPNI4OOdWEs7BsWs2dgyYZrKwEEoUorBk96aZ5Q
	gWRPFhJnmVEvKc9qSJEcocACSKfY74GvbH8rh5ohwpNngrWcfT151zgjlzLhf8XYEEV4
	zSrXqtbp8zn1XjZWY4IFt6QnvhxoSD5iQ49/JrjlxrcHnr3ecIjmXwNCysmgN35g2y6B
	Uf9g==
X-Gm-Message-State: AKGB3mLSCrRRBRiHrq4CUxxCA1WePdxv8ISycN2rjFVlptXIKXBsOSCt
	036G5T0tUyyxzn1Zd0iyQNtv
X-Google-Smtp-Source: ACJfBovy5OrJyk0UlXvYBskNgTfoPQH/lo4sc0iGlV86f7mu3v+BzFsEuj5HX6sqilBAuY8a1fLoAg==
X-Received: by 10.223.141.235 with SMTP id o98mr23933350wrb.39.1516035497142; 
	Mon, 15 Jan 2018 08:58:17 -0800 (PST)
Received: from pohly-mobl1 (p54BD55C5.dip0.t-ipconnect.de. [84.189.85.197])
	by smtp.gmail.com with ESMTPSA id s19sm91793wrg.29.2018.01.15.08.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 08:58:16 -0800 (PST)
Message-ID: <1516035495.6718.25.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?Jos=E9?= Bollo <jobol@nonadev.net>, wenzong fan
	<wenzong.fan@windriver.com>
Date: Mon, 15 Jan 2018 17:58:15 +0100
In-Reply-To: <20180115153346.44478168@d-jobol.iot.bzh>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
	<d85e2e6d-e7b1-8ebd-e3ce-01a26bdabbcc@windriver.com>
	<1515066650.10775.24.camel@intel.com>
	<7071668FA690C2448AC06FD9CFF240FD014013CF0D@ALA-MBC.corp.ad.wrs.com>
	<1515517307.6718.17.camel@intel.com>
	<c8acc16f-41fa-5818-79a5-78e99eaec6af@windriver.com>
	<20180115153346.44478168@d-jobol.iot.bzh>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Mon, 15 Jan 2018 16:58:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-01-15 at 15:33 +0100, José Bollo wrote:
> A possibility would be to filter the copied extended attributes. For
> SELinux we can just tell to not copy "security" attributes. See
> manual of the command "tar" (recent version) that has options
> --xattrs-exclude and --xattr-include.
> 
> Is there a need to copy extended attributes except for Smack?

In theory file-based capabilities. In practice those probably don't
occur in a home directory template.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



