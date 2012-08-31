Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T7UJM-000508-RR
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:43:13 +0200
Received: by obblz20 with SMTP id lz20so6004457obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=RJBQ8SYWAuLYBU+P+dXXzCRX+bqnph3gmzEP/r8m/q8=;
	b=uLeKLhcfrgV4/n/LQbnAD/iOPTo9anCb1wbAEIWsU82t6OIn5F3hDQpChw0JaIP/+5
	Ai+cujU4kO0FOnngaykDhXFydU0Gt9IKWQukozOmDoR/tHYrUEfRHxIQBy2k2SmsThs4
	q87TqeDmvIFQQ9VMeTEZCQH0hU8kGub1vy5rHBO6Q4lSv35mKKlFsU0uCGorSM0q4Y0D
	biHeAjxrTUsGcfdpuVx0ueExdmbjHqNBZN66xsGKNC/nykfm8BY7FTQDQCZPJG4+8WNt
	zC4GBzPR/jjMVHuf/CsfgN9Gx8f1m1iSvtrNghipLMGL/7gnH8kUTLZTA4W7tR/9S3kq
	0MRw==
MIME-Version: 1.0
Received: by 10.60.168.230 with SMTP id zz6mr8413625oeb.11.1346430655578; Fri,
	31 Aug 2012 09:30:55 -0700 (PDT)
Received: by 10.76.114.195 with HTTP; Fri, 31 Aug 2012 09:30:55 -0700 (PDT)
Date: Fri, 31 Aug 2012 18:30:55 +0200
Message-ID: <CALbNGRT51iB+D_7ShwYYx=KzDL=uafR_WTyYwQyjU+OSyFzknA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Last update breaks build
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
X-List-Received-Date: Fri, 31 Aug 2012 16:43:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

since the last layer updates I am not able to build. First I got

WARNING: Consider updating kde-artwork-active recipe to use "protocol"
not "proto" in SRC_URI.
                                                   | ETA:  00:01:13
WARNING: OPIE_VERSION has not been set; if you are going to build
Opie, you need to 'require' an appropriate .inc file from
meta-opie/conf/distro/include                                        |
ETA:  00:01:47
ERROR: Error executing a python function in <code>:
ExpansionError: Failure expanding variable FILESPATH, expression was
${@base_set_filespath([
"/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon-reload/opie-icon-reload-0-${OPIE_SRCREV}-r0",
"/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon-reload/opie-icon-reload-0-${OPIE_SRCREV}",
"/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon-reload/opie-icon-reload",
"/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon-reload/opie-icon-reload-0-${OPIE_SRCREV}",
"/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon-reload/opie-icon-reload",
"/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon-reload/files",
"/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon-reload"
], d)} which triggered exception SyntaxError: EOL while scanning
string literal (FILESPATH, line 1)

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "<code>", line 2, in <module>
ERROR:
ERROR:   File "__anon_564__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_base_bbclass",
line 200, in __anon_564__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_base_bbclass
ERROR:
ERROR:   File "/home/Superandy/oe-core/sources/bitbake/lib/bb/data_smart.py",
line 290, in getVar
ERROR:     return self.expand(value, var)
ERROR:
ERROR:   File "/home/Superandy/oe-core/sources/bitbake/lib/bb/data_smart.py",
line 154, in expand
ERROR:     return self.expandWithRefs(s, varname).value
ERROR:
ERROR:   File "/home/Superandy/oe-core/sources/bitbake/lib/bb/data_smart.py",
line 144, in expandWithRefs
ERROR:     raise ExpansionError(varname, s, exc)
ERROR:
ERROR: The code that was being executed was:
ERROR:      0001:__anon_125__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_staging_bbclass(d)
ERROR:  *** 0002:__anon_564__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_base_bbclass(d)
ERROR:      0003:__anon_218__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_package_bbclass(d)
ERROR:      0004:__anon_452__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_package_ipk_bbclass(d)
ERROR:      0005:__anon_756__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_insane_bbclass(d)
ERROR:      0006:__anon_20__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_debian_bbclass(d)
ERROR: [From file: '<code>', lineno: 2, function: <module>]
ERROR:      0196:    #
ERROR:      0197:    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
ERROR:      0198:    if override != '0':
ERROR:      0199:        paths = []
ERROR:  *** 0200:        fpaths = (d.getVar('FILESPATH', True) or '').split(':')
ERROR:      0201:        machine = d.getVar('MACHINE', True)
ERROR:      0202:        for p in fpaths:
ERROR:      0203:            if os.path.basename(p) == machine and
os.path.isdir(p):
ERROR:      0204:                paths.append(p)
ERROR: [From file:
'__anon_564__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_base_bbclass',
lineno: 200, function:
__anon_564__home_Superandy_data_oe_core_sources_openembedded_core_meta_classes_base_bbclass]
ERROR: Failed to parse recipe:
/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon-reload/opie-icon-reload_git.bb
WARNING: OPIE_VERSION has not been set; if you are going to build
Opie, you need to 'require' an appropriate .inc file from
meta-opie/conf/distro/include
ERROR: Command execution failed: Exited with 1


After removing meta-opie I now get

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    DISTRO 'angstrom-v2012.x' not found. Please set a valid DISTRO in
your local.conf

ERROR: Execution of event handler 'check_sanity_eventhandler' failed
ERROR: Command execution failed: Exited with 1

Do we have now poky world domination?

Andreas


