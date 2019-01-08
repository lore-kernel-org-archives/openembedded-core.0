Return-Path: <andrej.valek@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id BE9037BDD1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 07:14:42 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x087Ee0R012610
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 8 Jan 2019 08:14:40 +0100
Received: from [192.168.253.100] (MD1JJJ2C.ad001.siemens.net [163.242.44.88])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x087Ed2d008144;
	Tue, 8 Jan 2019 08:14:40 +0100
To: "Burton, Ross" <ross.burton@intel.com>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	mQENBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAG0J0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPokBPgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO57kBDQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABiQElBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <05af53a7-6ed6-9615-be2e-d8c31dbfb321@siemens.com>
Date: Tue, 8 Jan 2019 08:14:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Prelink problem
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
X-List-Received-Date: Tue, 08 Jan 2019 07:14:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Ross,

I would like to ask You a question about your commit, which removed
prelink dependency
(http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/insane.bbclass?h=thud&id=659c8b5267dc2220f67bfcb4ae2df91ae5052cdc).
Is it really necessary to remove the QADEPENDS = "prelink-native"?

I was trying to build extensible SDK with multilib support, but without
success. Here is the crash log:

     0709:        if not os.path.exists(prelink_cfg):

     0710:
shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),

 *** 0711:                        prelink_cfg)

     0712:

     0713:        cmd_prelink =
self.d.expand('${STAGING_DIR_NATIVE}${sbindir_native}/prelink')

     0714:        self._exec_shell_cmd([cmd_prelink,

     0715:                              '--root',

File: '/usr/lib/python3.5/shutil.py', lineno: 241, function: copy

     0237:

     0238:    """

     0239:    if os.path.isdir(dst):

     0240:        dst = os.path.join(dst, os.path.basename(src))

 *** 0241:    copyfile(src, dst, follow_symlinks=follow_symlinks)

     0242:    copymode(src, dst, follow_symlinks=follow_symlinks)

     0243:    return dst

     0244:

     0245:def copy2(src, dst, *, follow_symlinks=True):

File: '/usr/lib/python3.5/shutil.py', lineno: 120, function: copyfile

     0116:

     0117:    if not follow_symlinks and os.path.islink(src):

     0118:        os.symlink(os.readlink(src), dst)

     0119:    else:

 *** 0120:        with open(src, 'rb') as fsrc:

     0121:            with open(dst, 'wb') as fdst:

     0122:                copyfileobj(fsrc, fdst)

     0123:    return dst

     0124:

Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/home/.../1.0-r0/recipe-sysroot-native/etc/prelink.conf'


It points into meta/lib/oe/rootfs.py:705

if not os.path.exists(prelink_cfg):

shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),prelink_cfg)


How it's possible to copy non-existing file, because of removed
prelink-native dependency.

Do I need to explicitly inherit some class, let say image-prelink?
What am I doing wrong?

Regards,
Andrej

