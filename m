Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0w4z-0007LC-7e
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 16:29:34 +0100
Received: from mail-vc0-f200.google.com ([209.85.220.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 31 Jan 2013 07:13:37 -0800
Received: by mail-vc0-f200.google.com with SMTP id p1so3841397vcq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 07:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=jJkKHL6+TiI56sVrjaQd60vaxNCBOkKfkj/wPscYOIU=;
	b=GA1rS5VJEygL+XkCqfjEeCd7utL3ntGaBXl3DP6o93oh6ZnEYgFJDl1oYf1ec6BqG4
	VNaUeYumI9/dit1HsHSDpWwkD4dtLvv2lEx4kpX0bZ4wyuMv8a9VCydY0vuOC1LVAvo7
	ZPaDUYdXx9r1lk5BW+fGqa8DlSVE7NQcHdgTsWvL+YPh/mF+7jfA/QkBg8uR/D8tWRwT
	A651z44DHc5l+C47XqiKaPJY1e5gNXCcG73YNLtfjvVizWvjkGyEnRjARylIiN44t7Bn
	gxQdsz1cXYItw5F6v6ZT72pWn30GWOrcBhwtYCtsN5wL8b5LWbks8t0pZ5YZmXNQ0tgB
	u00w==
X-Received: by 10.58.50.7 with SMTP id y7mr4125159ven.24.1359645215817;
	Thu, 31 Jan 2013 07:13:35 -0800 (PST)
X-Received: by 10.58.50.7 with SMTP id y7mr4125152ven.24.1359645215684; Thu,
	31 Jan 2013 07:13:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Thu, 31 Jan 2013 07:13:15 -0800 (PST)
In-Reply-To: <1359635925-27715-1-git-send-email-ross.burton@intel.com>
References: <1359635925-27715-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 31 Jan 2013 15:13:15 +0000
Message-ID: <CAJTo0LaHQqg-3K_sHYr+i_-wsdJ3319YafjGDBT4bKstAjbi7Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQl3VyXhYcqc9qGTw6FrbkTaZpIGAU1M88nKXUVN6yuUo+sGBh2yyKYmDCxjKTaEVMwnB7SPpYVfI2EuQjvG8YqAy2gjQ1cfzKKHwhUxylldzkMb57u8tbpxubF2zVYCuW5LlFxUhVewyjeSWJhudZX99kIDausELvbHFQq7AC0sJhJYny4jXqWj8RGDu3PzsvSkIDz1
Subject: Re: [PATCH] polkit: respect systemd DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 15:29:37 -0000
Content-Type: text/plain; charset=UTF-8

On 31 January 2013 12:38, Ross Burton <ross.burton@intel.com> wrote:
> By default polkit uses systemd if it's available, which mean systemd runtime
> dependencies sneaking into non-systemd builds via sstate.
>
> Instead respect the systemd feature and enable/disable support as relevant.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Retracting this, Radu's systemd branch has a patch that isn't broken.

Ross


