Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 58D8C60110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 17:15:43 +0000 (UTC)
Received: by pabur14 with SMTP id ur14so14975829pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=K+sgN0P+GiZl0yBxLTC19dHyypLoesgPYmscDcpDbLY=;
	b=bPKIraEHVBmQZKFlbg21543wHGkj/qX2GFQcAiFwhR3BPR7WhvMGy/CozDjzwLRWq1
	lPylYtQXgmv88X8S+LQ1hQceEOIGy0Xp6fXMRq1g+OJ7Nf9IG1WxWTyqrmqgsQsPgy8m
	EqUDkUZ5Q7NezY+u2vlLZ62H9ADDXvzqKynzZeRMAjtdiDKqUtgx5BCGbJ4ZCldFaq+l
	5I7A/MCzlCCM//Zql2rynl+5qBVrPotiXkfRf9VIfBGf0qxsaWGuOQNIGSXjJuHec2PM
	EtHFJICHCXkCjiIGTarYOOcYYfQISIFJB732mz6xc9Mg/LArCffeBZRn7g0uYk6h0cTP
	HHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=K+sgN0P+GiZl0yBxLTC19dHyypLoesgPYmscDcpDbLY=;
	b=DNRoVmK6F+7ckbZa02r6NMrwpKwHOcfiwZlt/3R5cpMpFir1bBktTGK0+Xu+JVqGB/
	XPezsL9sVfVQs1bEHCWCEstGZBZantz3YEYpoK2Xg/TvBBGL8r/ZpVWVwP8187xaoi0i
	MnUXVwHFS7zYBO3QxKstGnwEGqMZtTHpK/OxDLOudK83LLj+9F9Xq/pYjmJgemKxNZzW
	bwpZ2EnghGl+TctOmuJYSuYwBGhrKeYlIpbdth0PKPapzALLToKj+p4LaQZOcDqUf7Fu
	HC5HvF849BBoLYICq3RWrjWImg635fb51v6sz6fMlHXfTVDp0s99y3LWLeMIRaap/LVu
	POEQ==
X-Gm-Message-State: ALoCoQm8NguV7Gr9BQRrL++YiByBASU6cqXUqjBONpDPagPzjnDxYYyFv9FeGR5bhQ2jt17K2qomWUamSaV1FqEaVysIRp7x1w==
X-Received: by 10.66.217.138 with SMTP id oy10mr1438500pac.112.1449594944471; 
	Tue, 08 Dec 2015 09:15:44 -0800 (PST)
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com.
	[209.85.192.173]) by smtp.gmail.com with ESMTPSA id
	kh9sm6096721pad.11.2015.12.08.09.15.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Dec 2015 09:15:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pfu207 with SMTP id 207so15019921pfu.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 09:15:43 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.68.201 with SMTP id m70mr6447259pfi.101.1449594943024;
	Tue, 08 Dec 2015 09:15:43 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 8 Dec 2015 09:15:42 -0800 (PST)
In-Reply-To: <CABcZANnjV02+O46SSWTKCh5CL-bfFDDgSpHNPMXjZ3bwJwJ3KQ@mail.gmail.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
	<0a2bdfd48b566acec7f05734758da7811980a0bb.1447455202.git.chris_larson@mentor.com>
	<CAJTo0LZYFwj9+5XOS6ewLTKwiWoBd7+YY+uXoCe0V4M7YwYRvg@mail.gmail.com>
	<CABcZAN=HG8AJCjWHWTwWGs4vswnEL=SRF81fZz5r+iE+iQZ76g@mail.gmail.com>
	<564F3ADB.7040000@intel.com>
	<CABcZANnjV02+O46SSWTKCh5CL-bfFDDgSpHNPMXjZ3bwJwJ3KQ@mail.gmail.com>
Date: Tue, 8 Dec 2015 15:15:42 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpZkPAUCXYg2XWKHRE9=HeCw760_hnw2b8wJ9R-guBuAg@mail.gmail.com>
Message-ID: <CAP9ODKpZkPAUCXYg2XWKHRE9=HeCw760_hnw2b8wJ9R-guBuAg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 6/6] psplash: add systemd support
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
X-List-Received-Date: Tue, 08 Dec 2015 17:15:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 8, 2015 at 1:38 PM, Christopher Larson <kergoth@gmail.com> wrote:
>
> On Fri, Nov 20, 2015 at 8:23 AM, Ross Burton <ross.burton@intel.com> wrote:
>>
>> On 18/11/2015 02:03, Christopher Larson wrote:
>>>
>>> Interesting, is psplash configured in our test environment? Either way,
>>> worst case we can drop this commit for now and can revisit it. I'm
>>> heading out of town tomorrow until December 1st, so likely will be
>>> limited in what I can do to address any issues that crop up during that
>>> period. Thanks.
>>
>>
>> It should be working - at least the sysvinit images work absolutely fine
>> and show the splash.  I'll add giving this a go locally to my list of things
>> to do.
>
>
> I'll dig into this shortly and re-submit if appropriate. Getting caught up
> on the status of submitted patches now. Thanks.

We have an internal user-space splash system and we ended using
libsystemd to notify when the initialization is complete.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

