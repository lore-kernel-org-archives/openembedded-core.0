Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B92C871C54
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 08:04:01 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w998419u021902
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 9 Oct 2018 10:04:01 +0200
Received: from [192.168.253.100] ([163.242.50.93])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id w99840mM010908;
	Tue, 9 Oct 2018 10:04:01 +0200
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20181004064004.4633-1-andrej.valek@siemens.com>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrej.valek@siemens.com; prefer-encrypt=mutual; keydata=
	xsBNBFkSzTcBCADSJTRk7YudjxZ/ma2IXPV4Y5gkACJKDOYAZcRqNjDbIFUmc7ck3KeuUGKy
	ifrpWD6/7YPXbixv4sAlFly6sNL31agVHLO4BCCE77DaZ2smiN0JaLYzmMdr0BPLMsL96nBO
	UDo8o2a1NwU+GpD8a0/vcovro+NgLvfk9xP4rYAve09VYvF4DbQNW9Y+8reqWFnBI8EN5Fps
	vPCUr/TSuxk3VpU//8QtP7WqyRA31qiWFDxE2dqSnrpUBojxQMY94tDP7kjQtzD2ZpaDt1oL
	PDE/n6qtYG792JVvNjuo1QpfPo8a8I4HvMmbh/Orv0fniauB229OaWNPp27ln55xG8FvABEB
	AAHNJ0FuZHJlaiBWYWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPsLAfgQTAQIAKAUC
	WRLNNwIbAwUJA8JnAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQ3npj5PmioO8DZQgA
	ibpOwfxDw3qlSEHDE395Tf+bEAYWjjNz9OQB4nnhq1Ql9jbUhfQQk/equaxoIfNHyLNDbeUU
	8ULLXJS+nDRi13yf2w/9L386fd5V63cdP6no2dpnEhwOKV1miiUtvcjDCe3bjm7WHVfg9OsF
	4AWox+/GR6sGJHRestHeXIJthmru8dB57oKy2fPgPpY1Ld1Wwb4okZgIi+1sKx19fk2xX9lc
	KpdvCXx+6FB3a9+sJTmb12meeGtKWC7BeElM2sG5NK7yx9zFNqSRebilwNankSE0QzWwmu4M
	bW6OTuxv/3qeHIvFH3EhrEmnd68Zm4+/jx2ZN5Ax23ZaGD8pabuO587ATQRZEs03AQgA0oCu
	faa9qlV0iYK+XlLcW6u55/o5psqtwoUCo8u18v8j4qB80r9latFKsO/SOjhVOYgIuzTTftQs
	Di71i9GJwK8Kk2FMo0YuJ9J9xdcvmjUI2vNUbOcaz2V0tRC9P/P5UaIltQAMVxbFHDwj17UA
	7YpEUL3ixxMs/usIKKGA+jIvsBdcn1WFji/NXLffwQ+zrAoT3q8EuGn4jSdROND16e9ynKgk
	D5D+EoA5RoFi8y3tRHJsi/dNlaUISsQOux/MgXsk1UU2lkmq7uxddRw8xwzG5dhx79sQp4Dt
	YpSfZBylD3DnCTg3ajdWCHGVyBdMLVncfj8sPDsVkCozTaSqFwARAQABwsBlBBgBAgAPBQJZ
	Es03AhsMBQkDwmcAAAoJEN56Y+T5oqDv8EEH/0qUECI1OpJS5R9Di9yc6YOfyNdCFHJ5rnUx
	dTr5+U3z30HBpzv1yPtO0fRQPulFRp2T81nhzT07B6Jce/pPUPE4QUVuwkM80KUbveJSNVHH
	Vp+9MGHEmpSevVHGKwzr+/7n5KJd5+SX3Y0mFxbu7GUZTMvM9Ra/p7lu0DsAH1CgEzKf3KTx
	FrUN9oSYETbN3l6+pxO3RYAxtCVRMCOCJ7skHkfPH0ADxsbecaKo2CHqcDJigqZBKxjnWYsm
	0+8mRhIQs3JuF0z7hKJGRacdGvKdQbCo0swLT9NVWU0IcUc/gwsCzQu/0Iml1x6MbgameiX4
	emYHzsJ3+vLapH+kAEI=
Message-ID: <6ebae7c0-b760-f53e-2e55-36979fc18685@siemens.com>
Date: Tue, 9 Oct 2018 10:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004064004.4633-1-andrej.valek@siemens.com>
Subject: Re: [PATCH] populate_sdk_base: move template files location to variables
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
X-List-Received-Date: Tue, 09 Oct 2018 08:04:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Do we have some blocker for this?

Regards,
Andrej

On 10/4/18 8:40 AM, Andrej Valek wrote:
> Let users to use custom toolchain template files instead of overloading
> the whole function.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index e07ad0cc6b..d9a391c613 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -228,14 +228,17 @@ fakeroot tar_sdk() {
>  	tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
>  }
>  
> +TOOLCHAIN_SHAR_EXT_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-extract.sh"
> +TOOLCHAIN_SHAR_REL_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-relocate.sh"
> +
>  fakeroot create_shar() {
>  	# copy in the template shar extractor script
> -	cp ${COREBASE}/meta/files/toolchain-shar-extract.sh ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
> +	cp ${TOOLCHAIN_SHAR_EXT_TMPL} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
>  
>  	rm -f ${T}/pre_install_command ${T}/post_install_command
>  
>  	if [ ${SDK_RELOCATE_AFTER_INSTALL} -eq 1 ] ; then
> -		cp ${COREBASE}/meta/files/toolchain-shar-relocate.sh ${T}/post_install_command
> +		cp ${TOOLCHAIN_SHAR_REL_TMPL} ${T}/post_install_command
>  	fi
>  	cat << "EOF" >> ${T}/pre_install_command
>  ${SDK_PRE_INSTALL_COMMAND}
> @@ -299,8 +302,8 @@ def sdk_variables(d):
>  
>  do_populate_sdk[vardeps] += "${@sdk_variables(d)}"
>  
> -do_populate_sdk[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-relocate.sh:True \
> -                                    ${COREBASE}/meta/files/toolchain-shar-extract.sh:True"
> +do_populate_sdk[file-checksums] += "${TOOLCHAIN_SHAR_REL_TMPL}:True \
> +                                    ${TOOLCHAIN_SHAR_EXT_TMPL}:True"
>  
>  do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
>  do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
> 

