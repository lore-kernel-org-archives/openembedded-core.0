Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id BC6F06012C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 16:27:22 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so36145022igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 08:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=zx4Aw1ZKLxl0afw92e9g9QZ06PdM54L6xWrJXgo5HI0=;
	b=hSpSNk9rta2wlZyY1LVn+C13k8kgyTQo+hYctQteTt7sXG5dsRBNCKYaDPM2M4I/vx
	cK3z41f4Sv5QS8U5SnjHbNoKv6hf/KRsfEZkDQOAHMczN8nN9N1+NVvHhi8Rc493tUfD
	g/Fp4LSrKApJT9daKCjfLtAXHnR0rI3TgjeQ93gMeMxNK3bj50KnVhxN6XgohG3XHOnq
	u7i9JOIprChdMedqqYm6rewqLcjJi8q/m4GreG4b3YEiAQhXOuF8I9tMTxzSHdwgudST
	XamJPBpqC6lmelvuG6/KW/NDd0o44/rg6H/SDpPvmgzT+Qjn3Kgu19E2rH7BF+TAeIzy
	ATCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=zx4Aw1ZKLxl0afw92e9g9QZ06PdM54L6xWrJXgo5HI0=;
	b=FEa6JixAcYDRpx+Fxk2CF4b5C3mydDYFLYeBpHSSwe6M08pI5bni/p9ZNz83eM4Vm9
	ZgHwl3QSaN2v7V1m+ozN1i6GxettS7WLKH1Jr2AnGt7HKsyKyxmoSeH7Z/FaJ4eLwEgT
	HttL4gB01Oo53fx+Di9kOgYOncTAR1boMuJ9YuBR4FujHWVttxzNPA9vDNE+gr074rwx
	OmIHmjJU54mZ0hkFCEdzHWzj0teBEkl+gO3xdboiFNpAm3w10ZQuwqdcw26uG61mZUv7
	tJ5AS8KxsO9rOZDarJ6AD20cNpkVHINB5dpXViF6DgX7YfH1j/Ulm3DFjYdt7t46mH/V
	swKg==
X-Gm-Message-State: ALoCoQmpF3ZLCdb/zgzoB32j/zeCeHBZBRedk4/KWllJiscSg3zW2RwHID6c+l3xLlTHfLnDFSea
X-Received: by 10.50.82.97 with SMTP id h1mr31142966igy.67.1449073643182;
	Wed, 02 Dec 2015 08:27:23 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DC4A.dip0.t-ipconnect.de. [93.232.220.74])
	by smtp.gmail.com with ESMTPSA id 75sm1402166ios.35.2015.12.02.08.27.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Dec 2015 08:27:22 -0800 (PST)
Message-ID: <1449073639.10734.65.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Date: Wed, 02 Dec 2015 17:27:19 +0100
In-Reply-To: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 02 Dec 2015 16:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-11-20 at 15:27 +0100, Andrew Shadura wrote:
> The split is no longer necessary, and only makes it more complicated to
> do changes in external layers.

I'm not sure about the "more complicated to do changes in external
layers". Why is that?

Quite the opposite, I found it useful that the version independent build
rules (*) were in a .inc file and relied on including that .inc file in
a "dbus-cynara" recipe which builds a specific fork of the source code
[2].

But I understand that this is an unusual usage of OE-core. As I didn't
notice the change in time (it's in master now), I'll just copy the
previous content of dbus.inc.

(*) However, a recent change in dizzy and fido already broke that
separation when adding a patch for 1.8.2 to the .inc file instead of
dbus-1.8.2.bb.

[1] http://cgit.openembedded.org/openembedded-core/commit/?id=a8aa06b2405dec31a306fdf47bd1fdf740fde7bd
[2] https://github.com/01org/meta-intel-iot-security/blob/7026d6e8e1084def0ebf203799360b54b5ac2763/meta-security-framework/recipes-core/dbus/dbus-cynara_1.8.18.bb

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




