Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5A26AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 07:46:43 +0000 (UTC)
Received: by igvg19 with SMTP id g19so7501997igv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 23:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=WwaCADKa1JxTOPwvgnhNi6lNWWyYk0RpRv8XuMLY9eY=;
	b=ze3HhtAyFtu7ohZwGY4b04oIdCM8+328GOhfFz9XGfUyG13CCDWK4AHVArK0wwszSN
	PctzUXQXOJKfB2GFdLHjAzUKVR+4WnpMWbI9PISK7dluh9sTEbGtTh1taP0i9bc+1UUP
	07t11S2fGE1hpqzbVZf2ozcVMkcVG5R698BW3m2OC/a8tYRslkqTVawZL3wMg/Nuxdw+
	GY4tD/A4JtVH7uo9p+o8+9q2CQ79bRyliKTOQePKaJaJ8LEylcoHrwt9wZAYpWyIydAS
	LxBSEMtoa/QCc2MGqqMbwmi8FqPhqd6+WjZmDjDMUNgIYT3N8J+ucvxyQ1mkEgwREd3P
	SG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=WwaCADKa1JxTOPwvgnhNi6lNWWyYk0RpRv8XuMLY9eY=;
	b=VaUMA11lS6AKEkNIZuEBTkQR4I9ShOFDOjmHp9h+wDt0zTdOLlk6YBcwzt2haNuyEr
	OxIZkKV6sKFzAOTzStdfo5xR6W5Nk4pwWeETeupFgw35uwKUqzeXEKjCx0iNhEXTdXXy
	op5K57lvPnG691mNrq0sqvJR3JlwrE4nnXzHpiz6jtiX27cdpTsWVOYEWr5G3p+CjVxz
	uxxScm0DNVSHcd9r2o+tLXwtfMdJiHBePilS5nNqep+7KLx8tQHoThUrePw2NuI7locg
	j6xwVHd/ZcVx5vCrMjtqUlSEx8lKmtYWeTYy3hPRrIHMmX1mnhYTIJzuA6r4RqXtI9kv
	PDFw==
X-Gm-Message-State: ALoCoQkmIJ9anZlMEjMSedyWodymbgxF6hZMvmbpiUc4ZUTMkTIDOutWhnKeJVYxGAFzolrHCACG
X-Received: by 10.50.183.9 with SMTP id ei9mr36080192igc.81.1449128804234;
	Wed, 02 Dec 2015 23:46:44 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C352.dip0.t-ipconnect.de. [93.232.195.82])
	by smtp.gmail.com with ESMTPSA id qb7sm2596445igb.8.2015.12.02.23.46.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Dec 2015 23:46:43 -0800 (PST)
Message-ID: <1449128801.10734.73.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 03 Dec 2015 08:46:41 +0100
In-Reply-To: <CAJTo0LZZZ8O_xnpg2fmqbD77JVWq89aYSUUujAWm7JbN=Q51hw@mail.gmail.com>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
	<1449073639.10734.65.camel@intel.com>
	<CAJTo0LZZZ8O_xnpg2fmqbD77JVWq89aYSUUujAWm7JbN=Q51hw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Andrew Shadura <andrew.shadura@collabora.co.uk>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] dbus: merge .bb and .inc
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
X-List-Received-Date: Thu, 03 Dec 2015 07:46:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-12-02 at 16:47 +0000, Burton, Ross wrote:
> 
> On 2 December 2015 at 16:27, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         I'm not sure about the "more complicated to do changes in
>         external
>         layers". Why is that?
>         
>         Quite the opposite, I found it useful that the version
>         independent build
>         rules (*) were in a .inc file and relied on including
>         that .inc file in
>         a "dbus-cynara" recipe which builds a specific fork of the
>         source code
>         [2].
>         
>         But I understand that this is an unusual usage of OE-core. As
>         I didn't
>         notice the change in time (it's in master now), I'll just copy
>         the
>         previous content of dbus.inc.
> 
> When a bb and an inc are split the inc has to be considered some sort
> of ABI.  For example, you couldn't remove a configure option that was
> removed in a new release from the .inc because older recipes that use
> the inc will still want it.  Then of course on new recipes that
> triggers a QA warning.  New options need to be added to the
> relevant .bb and not the inc, but then break if other users don't
> notice that they need to add options explicitly.  Basically the idea
> of bb/inc seems good, and in some situations is useful (multiple
> recipes maintained *in the same place* sharing common code) but as a
> method of re-using packaging it's got many pitfalls,

Thanks for the explanation, I understand now better why relying on
a .inc file is not recommended ;-) However, it remains unclear to me why
its presence makes changes in external layers more complicated. Based on
what you said, these external layers should completely ignore that there
is a .inc file and just work with the .bb file. I'm just curious whether
I'm still missing something.

> especially as your recipe could include the .bb from oe-core directly
> or be a bbappend.

In the layer I am trying to be compatible with OE-core master, dizzy,
fido and jethro. That means I cannot "require
recipes-core/dbus/dbus_1.8.18.bb" because that file only exists on
master.

It is possible to use a dbus_%.bbappend and then make changes based on
the current $PV (this is how some other differences between the OE-core
branches are handled), but that is not so easy for dbus-cynara because
it is not just modifying dbus. It's a new recipe.

I guess a virtual package created from the dbus recipe could work, but
that sounds way too complex compared to just copying the dbus.inc file.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




