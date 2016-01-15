Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id CE00A6057B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:03:15 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u188so20344538wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 04:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=iJXwMQyP1L+4xfAlQQ8tkyb8OzYrJzthmazBt+M6LDY=;
	b=sEau3NQSyGWSQ6U/pMxovTxpz54yGRBHAIUioBSZ6kozuKqq+fJP4J+mWZYnM2peta
	cMKYTyBGGWL1qhek+WNuCOSzTFE/hK1pOzeGUMm1JyXnkusK7LtztH+iL3Is1K7mCi2B
	ROkXjzhZRif/4IfsD98a1lVSGyhACgl+DE99kuCFaz70BlasgPH/YTP3nBX3dAW9Ov7N
	FiXB2oULCrInoUrkAzlk719Vls3srStVINBDjIPXqHojCxpH1OcHnmidQB+ZWENkWevV
	5uCwRWeyKg/QAAsWaMWPQ/RMoilgCpVmF92J5PBtCLUdkBW3oIbzWRhHYoZNieGBv0r2
	/SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=iJXwMQyP1L+4xfAlQQ8tkyb8OzYrJzthmazBt+M6LDY=;
	b=c96ypyxnkV8uc/JeiTfQLxX1npjwVsVVTZKzUV3AhgdaICWl6BEfh3mmuYxNmQzx5X
	2xLAooLl9gDsvdws+7ZOpmYxKMxtw5e55eeMcNaLzRDpIqOz2Hmj3A5q2Q7I5aZkG/GV
	BpV2Jgw9qHEpVNVySae0CdEPLV6Uz1KKstPj1AjiWAWeSLIRkrB2vLdAIe9JtrtGBkyu
	4sm0V6v2H1IRuOvmeePh/nZYhHW06eGipQxQXo7IWEawCBvRt+6AirwutYyA0I5v6SGP
	ifZhITlgYrN5Tuq2/MuQfNZ1ou4ACgCdK6LWkJ1PW1JtcsnkmcvDKWQc6fPXyLna4U/3
	b73w==
X-Gm-Message-State: AG10YOQDH7n3FK+HpGSaRdHDIW8EVieHHFGC3Bw2XQhsgguCDwdI26XKHgopqFJQHYl3WQ==
X-Received: by 10.28.141.10 with SMTP id p10mr2876165wmd.83.1452859395819;
	Fri, 15 Jan 2016 04:03:15 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	z127sm2265200wme.2.2016.01.15.04.03.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jan 2016 04:03:15 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Christopher Larson <clarson@kergoth.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <5698E002.5090800@dresearch-fe.de>
Date: Fri, 15 Jan 2016 13:03:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
Subject: fido -> jethro switching problem
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
X-List-Received-Date: Fri, 15 Jan 2016 12:03:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

for our internal development we use the Angstrom distro with some additional layers. Now we try to switch from fido to jethro branches and hit a problem where we are overchallenged.

Our local.conf contains

  DISTRO_FEATURES_remove = "x11 wayland"

what results in

- ------------------> snip <---------------------
ERROR: Overrides could not be expanded into a stable state after 5 iterations, overrides must be being referenced by other overridden variables in some recursive fashion. Please provide your configuration to bitbake-devel so we can laugh, er, I mean try and understand how to make it work.
ERROR: Error parsing configuration files
Traceback (most recent call last):
  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/parse/ast.py", line 88, in DataNode.getFunc(key='DISTRO_FEATURES', data=<bb.data_smart.DataSmart object at 0x7fe7ea9df650>):
             else:
    >            return data.getVar(key, False, noweakdefault=True, parsing=True)

  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/data_smart.py", line 565, in DataSmart.getVar(var='DISTRO_FEATURES', expand=False, noweakdefault=True, parsing=True):
         def getVar(self, var, expand=False, noweakdefault=False, parsing=False):
    >        return self.getVarFlag(var, "_content", expand, noweakdefault, parsing)

  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/data_smart.py", line 737, in DataSmart.getVarFlag(var='DISTRO_FEATURES', flag='_content', expand=False, noweakdefault=True, parsing=True):
                 removes = []
    >            self.need_overrides()
                 for (r, o) in local_var["_remove"]:
  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/data_smart.py", line 435, in DataSmart.need_overrides():
             else:
    >            bb.fatal("Overrides could not be expanded into a stable state after 5 iterations, overrides must be being referenced by other overridden variables in some recursive fashion. Please provide your configuration to bitbake-devel so we can laugh, er, I mean try and understand how to make it work.")

  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/__init__.py", line 102, in fatal:
         logger.critical(''.join(args), extra=kwargs)
    >    raise BBHandledException()

BBHandledException
- ------------------> snap <---------------------

And also if we remove this line we end in a similar exception

- ------------------> snip <---------------------
ERROR: Overrides could not be expanded into a stable state after 5 iterations, overrides must be being referenced by other overridden variables in some recursive fashion. Please provide your configuration to bitbake-devel so we can laugh, er, I mean try and understand how to make it work.
ERROR: Unable to parse DEFAULTTUNE_angstrom[:=]
Traceback (most recent call last):
  File "arm-defaults.inc", line 2, in arm_tune_handler(d=<bb.data_smart.DataSmart object at 0x7f9f383ea2d0>)
  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/data_smart.py", line 565, in DataSmart.getVar(var='TUNE_FEATURES', expand=True, noweakdefault=False, parsing=False):
         def getVar(self, var, expand=False, noweakdefault=False, parsing=False):
    >        return self.getVarFlag(var, "_content", expand, noweakdefault, parsing)

  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/data_smart.py", line 667, in DataSmart.getVarFlag(var='TUNE_FEATURES', flag='_content', expand=True, noweakdefault=False, parsing=False):
                 active = {}
    >            self.need_overrides()
                 for (r, o) in self.overridedata[var]:
  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/data_smart.py", line 435, in DataSmart.need_overrides():
             else:
    >            bb.fatal("Overrides could not be expanded into a stable state after 5 iterations, overrides must be being referenced by other overridden variables in some recursive fashion. Please provide your configuration to bitbake-devel so we can laugh, er, I mean try and understand how to make it work.")

  File "/home/sledz/work/HIPOS.jethro/bitbake/lib/bb/__init__.py", line 102, in fatal:
         logger.critical(''.join(args), extra=kwargs)
    >    raise BBHandledException()

ExpansionError: Failure expanding variable DEFAULTTUNE_angstrom[:=], expression was ${@arm_tune_handler(d)} which triggered exception BBHandledException:
- ------------------> snap <---------------------

Can someone give some hints what's going wrong here?

Additional info:
BitBake Build Tool Core version 1.28.0
angstrom-v2015.12-yocto2.0 67032251d761f0107322a85595062029b95d788d

Thx,
Steffen

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJWmOACAAoJEIz5slJ1krPhgBoP+gJvuy3bu3s+jC8OvXholWTF
iU25kd0aCHixe6qQn5rhvElak+T7/CSnIfgePPC9rz2h3AS6SkRUiernQmKxqvSE
zXJCacMkfeOlX3J2Kjw5NZGU7K1flZcWU1gAPEaFjkaKUZfYie9ftGXrwm+uMcwH
QgRBIa/xwYokmFDna2opz3Uv+B5Z5k2/PGNGQYEBErSTOSFgFAWjkNVI01jeMtSc
bBGzKU9jIpOaWDV2UnHgglWfUr8IEdUnuP61nM2C4uAXfTCAuKQAspo+FtDsaXTy
6nvgZgYV0/4RUl0x/8G+V0Hc8Iwe30c3tDShU8QF2OsNNXxbBtQgBgTciVTUEznr
GN6OdosEy7+KHpFWML/vSgwoWieCVk0C6Tnre+da+HTxoYNkQtaNljsar0rYaMX0
YNBgqYbKBPG+dW3mIW5sRR4jzzrXp82t7naTuNP49k5wY0Adkn0hg4jqTz/pgES8
d4iNE9T5dZ7o2wxwD6zSl/QlWjVBLhbQfdOJvCSRd/vjce4kkihBFZTgN1twV9y1
4oTa1m+0A/5uJq2g4IGm/PfeI7QNp6keaOEE3dC3IX+nx0KwTF3Zd1UQFWDOzQIz
+WVt6pCNnpHv/HZETkl+TelQePqu2Fb29jg8Ex82TO7CBQhzWwPsVzYiRcH9suwb
qPm924F6B+DB3SHmefth
=cOzb
-----END PGP SIGNATURE-----

