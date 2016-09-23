Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 774C1607A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 05:51:56 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id o3so5948733ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 22:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=jUbLZ+1JX1STWuMhQAHXglQz0OFWZ4lFzeJeS8ejDhY=;
	b=G33nzVftz9gLqitapkKhPfV2Ns9NlNtqDWZ5qCrAbbmV5sm/wnadZdykw+2wql3j1F
	MdZ+m2G9uWvrPdiaksv8Y86gJRZlg32fLdp5nPM53z4jd8AhXGtdKhHlfuTsKN872RXg
	WKgsG4VXMIgY04fYBQr8Ey2O0UVDTjxdnx3v/Ni4kCkr6A7gQbiQXwTYwbhoaG8SiXYF
	q3KjgTiXwb6tfYA51mAFTqgxjz9SbAJwwYonqVw/sGk8+y1edJEufQOuaIQefocru6rL
	oqFl+YeXwv2acQQDrcQyN+oxzTe1Pvl6lf/nxULS9BqdYdSEKBd8LDsBi1eF3moB2oLM
	POyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=jUbLZ+1JX1STWuMhQAHXglQz0OFWZ4lFzeJeS8ejDhY=;
	b=fDW8k+VlGNwQZRju79qPWKyFBY3TaEoqvXfYHfyaZcHYgzOIHwnQHz85ZtVJ0WC8VK
	417MxeH3fltUSFPvaJ/6He8GC/il+IliLPmpLStF1U0GwwcSRFnIn3SUpR/wZIkjWsYH
	WYhaJRODxN3wtE92ip/bGCsGR2RQYetsq3tkV2xUrAAWQ1ALrQP5u85cSIL2yyPxOCoS
	f3xZumR2p/Ml9ncjzp8jHVydvupC0W2atnBhMxKpX6+VJxCZaJ+xvFermTyR13OsY3sj
	9ed9vhKb1GBZBXVvn+sWeyQJMEJI5HDumDVgLq9RixCA66G/gXtc/0jCPidIUgfb97p8
	nM2w==
X-Gm-Message-State: AA6/9RlweH2B9Y1OlCPi7VNIBPfPw1julp9uXVfzt/PYepUIvZ9iYLrxkEnDoiSdBZLUKEl7
X-Received: by 10.36.209.196 with SMTP id w187mr1188263itg.47.1474609918434;
	Thu, 22 Sep 2016 22:51:58 -0700 (PDT)
Received: from pohly-mobl1 (p57A56298.dip0.t-ipconnect.de. [87.165.98.152])
	by smtp.gmail.com with ESMTPSA id
	f135sm2285432iof.12.2016.09.22.22.51.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Sep 2016 22:51:49 -0700 (PDT)
Message-ID: <1474609905.5472.1.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Fri, 23 Sep 2016 07:51:45 +0200
In-Reply-To: <CABcZANn=y0AK=_Uqed+5E4hQk01JyoTcofQNGdHfxkSG7NQmjA@mail.gmail.com>
References: <1474472342.16834.96.camel@intel.com>
	<20160921160854.GB2633@jama> <1474548771.16834.100.camel@intel.com>
	<CABcZANn=y0AK=_Uqed+5E4hQk01JyoTcofQNGdHfxkSG7NQmjA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: rm_work + pybootchart enhancements
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
X-List-Received-Date: Fri, 23 Sep 2016 05:51:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-09-22 at 10:37 -0700, Christopher Larson wrote:
> 
> On Thu, Sep 22, 2016 at 5:52 AM, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         That's bitbake specific. What I was remembering is something
>         generic
>         that works for anything that prints test results on stdout. 
...
> I use https://github.com/rustyrussell/stats for that, quite handy.

That's it, thanks. I even still had it in my $HOME/bin... now I just
need remember it the next time that I need it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




