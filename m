Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B4AF6E667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 22:19:08 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id dx3so1807143pab.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=G9ui74oFvc61v5iW9aoKrhxORg85x/uzjqNxUZjxAkA=;
	b=ibTR9UA+W/QMi9YudVyfwCur/fGClaVH/bYZy5TFoS46FGgj98oOuCn0jdLcctvj+D
	mxqybVD2YseAZSFac4bXhttOKYuQ1AH7xl6vkd0gnBvZ6T1Y+swzgaJ/QdIIb7u72R99
	uHtxprwFqO3BI4fIQsQqv6q2fYBuJLYM2UiNvJHFNnTH7nXKPohHk0z6xgK/Gh0pwmSP
	++qCjod7rFtQUnV3pyUDE7naw804przUFBmLjkJnHPSTmYd+r6nQUWzUmJUVJ6YHI898
	IjXrzhm6Q9pScKpnCT5wKKN8XnAPtbN0ND2B7xWTJ6k4JrrPB3wREuOPSrJGaNvKpbvn
	OMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=G9ui74oFvc61v5iW9aoKrhxORg85x/uzjqNxUZjxAkA=;
	b=k9+cPoj7xkFr3QbsVsUDWBQplaIxzv/qppUBDM0+N62alY5jFNcNR1PQPJfjMqMkeu
	vdt9S7/1AZ0tMhqzwdcxPxKJ7+eb4emNn2m342lfmbFzrnRWigY90W2t2UrSfxnJoRQr
	pV/yqnvfZod5QV5CvQfY0ak5aZq6R3pSNU/IJ4GpATHoNve6SkKjgKjwUqNX93cgFT1U
	e+6Ytred1MEK/6MvHKCySPVySTHPGAE7ENf3c057ojsbukE71zfb2b0qGeRu3wnLmJzD
	s9jR8+08iO3L/V11V+kg3Eg4fusvRN78S6i5Lk0SoBVKgtF81BH995EI9ipM3n4ZnM9K
	M27Q==
X-Gm-Message-State: ALyK8tI33fHP506ldOsXc25hIOrMKgC3PT4wOnecvHZTPFWb5CpHlkes1tLQ1gEK1BVE2g==
X-Received: by 10.66.232.37 with SMTP id tl5mr7855441pac.13.1468361949731;
	Tue, 12 Jul 2016 15:19:09 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.158])
	by smtp.googlemail.com with ESMTPSA id
	p75sm7366932pfa.71.2016.07.12.15.19.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 15:19:07 -0700 (PDT)
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
References: <cover.1456412549.git.mariano.lopez@linux.intel.com>
	<5249539744d86c132ab2566a3bb99de260880e6d.1468241364.git.mariano.lopez@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57856CDA.5070201@gmail.com>
Date: Tue, 12 Jul 2016 15:19:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <5249539744d86c132ab2566a3bb99de260880e6d.1468241364.git.mariano.lopez@linux.intel.com>
Subject: Re: [PATCHv3 1/2] cve-check-tool: Add recipe
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
X-List-Received-Date: Tue, 12 Jul 2016 22:19:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Mariano,


On 07/11/2016 05:52 AM, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> cve-check-tool is a program for public CVEs checking.
> This tool also seek to determine if a vulnerability has
> been addressed by a patch.

By tool do you mean the "cve-check-tool"? All the Nvd DB can tell you if
an CVE has been assigned, anything more than that is not guaranteed.

Look at https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5320

> 
> The recipe also includes the do_populate_cve_db task
> that will populate the database used by the tool.

This DB is big. May want to add a note to that affect. Maybe a note
about how to share the DB across builds like with the AB.

time for me to play with this.

Thanks for driving this.
regards,
Armin

> 
> [YOCTO #7515]
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  .../cve-check-tool/cve-check-tool_5.6.4.bb         | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> 
> diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> new file mode 100644
> index 0000000..0cf64e4
> --- /dev/null
> +++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
> @@ -0,0 +1,55 @@
> +SUMMARY = "cve-check-tool"
> +DESCRIPTION = "cve-check-tool is a tool for checking known (public) CVEs.\
> +The tool will identify potentially vunlnerable software packages within Linux distributions through version matching."
> +HOMEPAGE = "https://github.com/ikeydoherty/cve-check-tool"
> +SECTION = "Development/Tools"
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e8c1458438ead3c34974bc0be3a03ed6"
> +
> +SRC_URI = "https://github.com/ikeydoherty/${BPN}/releases/download/v${PV}/${BP}.tar.xz"
> +
> +SRC_URI[md5sum] = "c5f4247140fc9be3bf41491d31a34155"
> +SRC_URI[sha256sum] = "b8f283be718af8d31232ac1bfc10a0378fb958aaaa49af39168f8acf501e6a5b"
> +
> +DEPENDS = "libcheck glib-2.0 json-glib curl libxml2 sqlite3 openssl"
> +
> +inherit pkgconfig autotools
> +
> +EXTRA_OECONF = "--disable-static"
> +
> +python do_populate_cve_db () {
> +    import subprocess
> +    import time
> +
> +    if d.getVar("BB_NO_NETWORK", True) == "1":
> +        bb.error("BB_NO_NETWORK is set; Can't update cve-check-tool database, "
> +                  "CVEs won't be checked")
> +        return
> +
> +    bb.utils.export_proxies(d)
> +    # In case we don't inherit cve-check class, use default values defined in the class.
> +    cve_dir = d.getVar("CVE_CHECK_DB_DIR", True) or d.expand("${DL_DIR}/CVE_CHECK")
> +    cve_file = d.getVar("CVE_CHECK_TMP_FILE", True) or d.expand("${TMPDIR}/cve_check")
> +    cve_cmd = "cve-check-update"
> +    cmd = [cve_cmd, "-d", cve_dir]
> +    bb.debug(1, "Updating cve-check-tool database located in %s" % cve_dir)
> +    try:
> +        output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
> +        bb.debug(2, "Command '%s' returned:\n%s" % ("\n".join(cmd), output))
> +        if bb.data.inherits_class('cve-check', d):
> +            time_utc = time.gmtime(time.time())
> +            time_format = "%Y-%m-%d %H:%M:%S"
> +            with open(cve_file, "w") as f:
> +                f.write("CVE database was updated on %s UTC\n\n"
> +                        % time.strftime(time_format, time_utc))
> +
> +    except subprocess.CalledProcessError as e:
> +        bb.warn("Error in executing cve-check-update: %s (output %s)" % (e, e.output))
> +        if bb.data.inherits_class('cve-check', d):
> +            bb.warn("Failed to update cve-check-tool database, CVEs won't be checked")
> +}
> +
> +addtask populate_cve_db after do_populate_sysroot
> +do_populate_cve_db[nostamp] = "1"
> +
> +BBCLASSEXTEND = "native"
> 

