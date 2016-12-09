Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id B0D6571CC5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 07:57:07 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id a81so40581223ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 23:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=oA1ebZspg/uufe9h5hZuVwCAIOaEuyeyXgBf5PejXUQ=;
	b=kcLcpEgh/fKjd+CkV12wQt6yxE+BROQHu7y1y2bGlVTj2HP9hAeLcEHfsEmu1qIEus
	buvx+aThZSDrGbkeXJaF8Fw9osy+wyrNKMtFj10CVEQQ+GI+IbTsGLKunc1agAV1cO+5
	3jNQVV+UnWMwrMejhhZXpiW1QcLUBbCq5zPX/1Y/aENlIluKh678H3bBjalfMDrmK8C2
	MUwIkIXJxZJXLgwE9BLx9LyajFFSQFAeGWJvY/nFv3ZvVivVhm5noPn13FCx7Q5LmDk4
	DrH/WYNRH1hLlw7mVQF+G1f5WDocNM9hclWKEDVNv/A6VA9vLIt/QypriyiS2TyuBKaS
	9Tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=oA1ebZspg/uufe9h5hZuVwCAIOaEuyeyXgBf5PejXUQ=;
	b=JTuA/7sp/timg4TpRThPyFiBcgX3SaFMNkNG6dS80ygFPDKb2Z2oHaIkIx+1ZNGbWR
	XEvFZx2qXtF0oE3gqaATLjU1/AtU4QryEU0sJJP8JTLiZprA4yLDmfPz2c3k1dcZIcmP
	SF3UAC5Mn7V9NboseRDDgvHo2vfr4ofezNxbTl8Dj+N+ukWbni8NhzbO3VORGc9Azk3z
	zwZJLTiAD8Jhz3708IyMf0AjSlcNCMBzPi3AsBVIWozNYkwBWZrsH0SXsPDkkctOTx2A
	i+0VkSTMHeX4ccAls1yzFx6TmB2jdBjEwsOWroZeLOLQd04JS3SoQQdY37aTru7E0RwU
	x4lg==
X-Gm-Message-State: AKaTC02IJFVTuxRr23VraA0CNbmZLK42scXI4vBNHj+hQGs03pJBTzi4bGgg5yCBhAONkHfO
X-Received: by 10.107.174.142 with SMTP id n14mr66750076ioo.205.1481270228870; 
	Thu, 08 Dec 2016 23:57:08 -0800 (PST)
Received: from pohly-mobl1 (p57A56203.dip0.t-ipconnect.de. [87.165.98.3])
	by smtp.gmail.com with ESMTPSA id
	m83sm14411158ioi.11.2016.12.08.23.57.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 23:57:08 -0800 (PST)
Message-ID: <1481270225.17535.133.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Fri, 09 Dec 2016 08:57:05 +0100
In-Reply-To: <5dbe9bcf-935d-dd2c-1a8e-2a62c569aab8@opendreambox.org>
References: <cover.1480346284.git.patrick.ohly@intel.com>
	<d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
	<5dbe9bcf-935d-dd2c-1a8e-2a62c569aab8@opendreambox.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/11] buildstats: add system state sampling
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
X-List-Received-Date: Fri, 09 Dec 2016 07:57:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-12-09 at 01:29 +0100, Andreas Oberritter wrote:
> Hi Patrick,
> 
> On 28.11.2016 16:33, Patrick Ohly wrote:
> > +    def sample(self, force):
> > +        now = time.time()
> > +        if (now - self.last > self.min_seconds) or force:
> > +            for filename, output in self.proc_files:
> > +                with open(os.path.join('/proc', filename), 'rb') as input:
>                         ^
> this fails with a backtrace if /proc/diskstats is not available, which
> may be the case in virtualized environments, e.g. Linux-VServer.

Thanks for pointing that out, I'll send a fix.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




