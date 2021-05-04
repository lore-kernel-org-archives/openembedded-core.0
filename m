Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.26])
 by mx.groups.io with SMTP id smtpd.web12.4226.1620127485064950761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 04:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=hXHZCKzj;
 spf=pass (domain: outlook.com, ip: 40.92.65.26, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIOH6szAEUsgszOm/KIpW+P5QDT31DYUkdomUVnRj8ZpVQ7xHdOnNYuQ9hE1kgirvBJNLEBLFVtI+k55noZwUAvqWLYTrQNTm1N3+tzZnANwIG/vdZCT5DWYD9dyzlmPZQIPYDhcNqyOyXa6opQuzTDNZo8atBha5mBowjZPrhlUe0L6PvJe5VeoD1+ghgTM/e8mKSSRovgRwgpdbrmndFXE6PR05yKDZoer0hTSpoXmdOjzpyz32J4idUHf2HVHnM2MstX4JvgG+OYuovcBfR/tlPnlrvf/YBE8abbZA+y0sntKoL7zmBl2Hzd/ZXh9SCUmhgaCqN/+vNVOQssXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5YavQ+6or8fKNGjJbIt5MwSxkA6GmaHdV2jqctO4Is=;
 b=StoGOA31uKNOMFr9KqZXDQBdTTT15iLN/bRnFdwkLtoII+Q3fJDI0AbNxq1FCRbgXAoVtmTYYa/iH3qoIarG6PQv/ESopz70HpXKK72jILnObArzqmupg2cXvZfOxqeijww4lJeEqm25CmwAWpLnTZNqaP14dDkCGexNOrusd2RLHdTH2aQQAsZivWV9/Jhvkdy/O1AZUdzAM3bZObtnbb24+t7K4swPYOtyInSPPjFI6eU6dOjx/cwtE+/jLzUFqPpzW/Kmn1lmH0Rh0NVfZ2CG/3pkovXQDwxl6K3RS3XY+7AaoOpgb+jjaPycvOuf38oXJmVnw4TBHdEFztdUIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5YavQ+6or8fKNGjJbIt5MwSxkA6GmaHdV2jqctO4Is=;
 b=hXHZCKzjevjoens0BdSgsPMEbF5sBlER6B0CjaNyCG4E8SWsp2jiqfmVZ0A1dDyJiiC2Psm00DnsdnOhSrqqIoEz6S/AZyYySDvO49uH/vUrYWPCMCnfbnFbeaic4zm1lzmKXpTzBsHjq/uygZT/r3/lGm4SROQzL5Ds37GN7b421VWLXr0DF6bnwsL332O9yUFbFS3OhWQp77z3TJSPUcA/LSIGGT+o3EgSZrrclmMdhxOATVtGvqUVN6ZSFh7G3xeo5pnn3bkUi8mY26xO2fqUzNOb+CffbeL9pZoin7go9m7D2LQtB2GZ2X0GjkcSCN6qPfdJZTNSaIKEYgVqcQ==
Received: from HE1EUR01FT042.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e18::45) by
 HE1EUR01HT149.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e18::367)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27; Tue, 4 May
 2021 11:24:42 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e18::53) by HE1EUR01FT042.mail.protection.outlook.com
 (2a01:111:e400:7e18::228) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Tue, 4 May 2021 11:24:42 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:B76632FDB56C312313E9E7BBCDCB1E8E77117F9773D4390CBB26CF155EEB636D;UpperCasedChecksum:2E3EF74629CE81A6B978F58905252105683FD45891DD5EBD06F750B0DC6492C7;SizeAsReceived:8651;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 11:24:42 +0000
Subject: Re: [OE-core] [PATCH] ccache: add packageconfig docs option
To: Bastian Krause <bst@pengutronix.de>,
 openembedded-core@lists.openembedded.org
References: <20210504112050.32393-1-bst@pengutronix.de>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642814415A3D958307A8C2AA85A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 4 May 2021 13:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210504112050.32393-1-bst@pengutronix.de>
X-TMN: [Hyr4bdbkaqOfuQy+wMCqwlaDHVUPiKQm]
X-ClientProxiedBy: AM6PR05CA0033.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::46) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <a7edbea3-d61b-bb29-d2b9-240291c144b4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.93.168) by AM6PR05CA0033.eurprd05.prod.outlook.com (2603:10a6:20b:2e::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 11:24:42 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 75d344c5-d85a-460f-b47c-08d90eef3676
X-MS-TrafficTypeDiagnostic: HE1EUR01HT149:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Klq3Ku+S6nV4YD/ukYvRBNWh2FQmC5FbpekC5/yLTCc8rgZ+BKOM1LORoCwPqhZtvmosCObebgXVw0IH2O4gPWVFlWQoCdh8Hh5J9YBbM9IF2m/8mvKznxMgu2x12jhwvgD1gZUa0qk01gDC+2vGmZQqTWSJjuDfjUutITRjOjJfH8YkXWWbHIvCOOWLLCo15CLjhpTWuviLCpyEcWj0JldKil19uHQFoVTFoMEROQ5ZsX3jH6MASrMopim+IYw99TGl5yCBN4tmpeWrdTIYqoExInERMadxY0gnWfy57bEGuwwFue0CYC13uTzjrrzt3z+7RpXBdOvmg3oIortB1hefz8oGywI/Qp/FhdUo/6nNefuuZcqIkK1pDhPSv+ymRmxvUL5Husjmi7DBYFI1TqvsxRX7gk0HAo/K5rP5Z0Fqw3PnlEwFm5XPZgeTrcHj
X-MS-Exchange-AntiSpam-MessageData: 
	2jBDJsrUDlnSOf9xcSpV2KkkHzvnPGoXPSziIXNBilsZqyHJrEOhDWodUs+aEtOMTgwRPTemP+x03uLvs5JZwHgMS2RmI2tedtYz6V9k7esv0QNEOgFDW0RwkHr4EOuFmt2foMmq+pIi3oC13z9apw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d344c5-d85a-460f-b47c-08d90eef3676
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 11:24:42.5776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT042.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT149
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 04.05.21 13:20, Bastian Krause wrote:
> Before, ccache's configure stage built HTML documentation and man pages
> depending on if asciidoc is installed. This patch makes it configurable.
> 
> Pass the new cmake option BUILD_DOCS along and add the asciidoc
> dependency if necessary.
> 
> This fixes an issue when ccache's configure stage found asciidoc/a2x on
> the system outside of the sysroot (e.g. installed via 'apt install
> asciidoc'). ccache would then decide to build docs and manual pages, but
> would fail during compilation: the system's a2x could not find the
> system's asciidoc because it did not reside in the set PATH.
> 
> By enabling/disabling docs/man page generation explicitly and adding
> asciidoc to DEPENDS as necessary, this is no longer an issue.
> 
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
>   ...w-disabling-docs-man-page-generation.patch | 161 ++++++++++++++++++
>   meta/recipes-devtools/ccache/ccache_4.2.1.bb  |   6 +-
>   2 files changed, 166 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
> 
> diff --git a/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch b/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
> new file mode 100644
> index 0000000000..11176e3039
> --- /dev/null
> +++ b/meta/recipes-devtools/ccache/ccache/0001-doc-allow-disabling-docs-man-page-generation.patch
> @@ -0,0 +1,161 @@
> +From e87d882e8c31e4c6b90e770643c0d176c2455a01 Mon Sep 17 00:00:00 2001
> +From: Bastian Krause <bst@pengutronix.de>
> +Date: Tue, 4 May 2021 11:41:56 +0200
> +Subject: [PATCH] doc: allow disabling docs/man page generation
> +
> +The assumption that HTML documentation and manual pages should be
> +generated if the required tools (asciidoc) are present is not always
> +true. So add a cmake option that allows disabling the docs/man page
> +generation. The default is to generate docs/man pages like before.
> +
> +Origin: https://github.com/ccache/ccache/pull/844
> +Upstream-Status: Pending

Just some nitpick, but shouldn't that be Submitted instead - as I see a 
PR open for this feature at the mentioned upstream repo

(see https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines)

> +Signed-off-by: Bastian Krause <bst@pengutronix.de>
> +---
> + doc/CMakeLists.txt | 128 +++++++++++++++++++++++----------------------
> + 1 file changed, 66 insertions(+), 62 deletions(-)
> +
> +diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
> +index c5ce224d..74b7831b 100644
> +--- a/doc/CMakeLists.txt
> ++++ b/doc/CMakeLists.txt
> +@@ -1,70 +1,74 @@
> ++option(BUILD_DOCS "Indicates whether HTML documentation and manual pages should be built or not" ON)
> ++
> + find_program(ASCIIDOC_EXE asciidoc)
> + mark_as_advanced(ASCIIDOC_EXE) # Don't show in CMake UIs
> +
> +-if(NOT ASCIIDOC_EXE)
> +-  message(WARNING "Could not find asciidoc; documentation will not be generated")
> +-else()
> +-  #
> +-  # HTML documentation
> +-  #
> +-  function(generate_html adoc_file)
> +-    get_filename_component(base_name "${adoc_file}" NAME_WE)
> +-    set(html_file "${base_name}.html")
> +-    add_custom_command(
> +-      OUTPUT "${html_file}"
> +-      COMMAND
> +-        ${ASCIIDOC_EXE}
> +-          -o "${html_file}"
> +-          -a revnumber="${CCACHE_VERSION}"
> +-          -a toc
> +-          -b xhtml11
> +-          "${CMAKE_SOURCE_DIR}/${adoc_file}"
> +-      MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/${adoc_file}"
> +-    )
> +-    set(html_files "${html_files}" "${html_file}" PARENT_SCOPE)
> +-  endfunction()
> ++if (BUILD_DOCS)
> ++  if(NOT ASCIIDOC_EXE)
> ++    message(WARNING "Could not find asciidoc; documentation will not be generated")
> ++  else()
> ++    #
> ++    # HTML documentation
> ++    #
> ++    function(generate_html adoc_file)
> ++      get_filename_component(base_name "${adoc_file}" NAME_WE)
> ++      set(html_file "${base_name}.html")
> ++      add_custom_command(
> ++        OUTPUT "${html_file}"
> ++        COMMAND
> ++          ${ASCIIDOC_EXE}
> ++            -o "${html_file}"
> ++            -a revnumber="${CCACHE_VERSION}"
> ++            -a toc
> ++            -b xhtml11
> ++            "${CMAKE_SOURCE_DIR}/${adoc_file}"
> ++        MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/${adoc_file}"
> ++      )
> ++      set(html_files "${html_files}" "${html_file}" PARENT_SCOPE)
> ++    endfunction()
> +
> +-  generate_html(LICENSE.adoc)
> +-  generate_html(doc/AUTHORS.adoc)
> +-  generate_html(doc/MANUAL.adoc)
> +-  generate_html(doc/NEWS.adoc)
> ++    generate_html(LICENSE.adoc)
> ++    generate_html(doc/AUTHORS.adoc)
> ++    generate_html(doc/MANUAL.adoc)
> ++    generate_html(doc/NEWS.adoc)
> +
> +-  add_custom_target(doc-html DEPENDS "${html_files}")
> +-  set(doc_files "${html_files}")
> ++    add_custom_target(doc-html DEPENDS "${html_files}")
> ++    set(doc_files "${html_files}")
> +
> +-  #
> +-  # Man page
> +-  #
> +-  find_program(A2X_EXE a2x)
> +-  mark_as_advanced(A2X_EXE) # Don't show in CMake UIs
> +-  if(NOT A2X_EXE)
> +-    message(WARNING "Could not find a2x; man page will not be generated")
> +-  else()
> +-    # MANUAL.adoc -> MANUAL.xml -> man page
> +-    add_custom_command(
> +-      OUTPUT MANUAL.xml
> +-      COMMAND
> +-        ${ASCIIDOC_EXE}
> +-          -o -
> +-          -a revnumber=${CCACHE_VERSION}
> +-          -d manpage
> +-          -b docbook "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
> +-        | perl -pe 's!<literal>\(.*?\)</literal>!<emphasis role="strong">\\1</emphasis>!g'
> +-            >MANUAL.xml
> +-      MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
> +-    )
> +-    add_custom_command(
> +-      OUTPUT ccache.1
> +-      COMMAND ${A2X_EXE} --doctype manpage --format manpage MANUAL.xml
> +-      MAIN_DEPENDENCY MANUAL.xml
> +-    )
> +-    add_custom_target(doc-man-page DEPENDS ccache.1)
> +-    install(
> +-      FILES "${CMAKE_CURRENT_BINARY_DIR}/ccache.1"
> +-      DESTINATION "${CMAKE_INSTALL_MANDIR}/man1"
> +-    )
> +-    set(doc_files "${doc_files}" ccache.1)
> +-  endif()
> ++    #
> ++    # Man page
> ++    #
> ++    find_program(A2X_EXE a2x)
> ++    mark_as_advanced(A2X_EXE) # Don't show in CMake UIs
> ++    if(NOT A2X_EXE)
> ++      message(WARNING "Could not find a2x; man page will not be generated")
> ++    else()
> ++      # MANUAL.adoc -> MANUAL.xml -> man page
> ++      add_custom_command(
> ++        OUTPUT MANUAL.xml
> ++        COMMAND
> ++          ${ASCIIDOC_EXE}
> ++            -o -
> ++            -a revnumber=${CCACHE_VERSION}
> ++            -d manpage
> ++            -b docbook "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
> ++          | perl -pe 's!<literal>\(.*?\)</literal>!<emphasis role="strong">\\1</emphasis>!g'
> ++              >MANUAL.xml
> ++        MAIN_DEPENDENCY "${CMAKE_SOURCE_DIR}/doc/MANUAL.adoc"
> ++      )
> ++      add_custom_command(
> ++        OUTPUT ccache.1
> ++        COMMAND ${A2X_EXE} --doctype manpage --format manpage MANUAL.xml
> ++        MAIN_DEPENDENCY MANUAL.xml
> ++      )
> ++      add_custom_target(doc-man-page DEPENDS ccache.1)
> ++      install(
> ++        FILES "${CMAKE_CURRENT_BINARY_DIR}/ccache.1"
> ++        DESTINATION "${CMAKE_INSTALL_MANDIR}/man1"
> ++      )
> ++      set(doc_files "${doc_files}" ccache.1)
> ++    endif()
> +
> +-  add_custom_target(doc ALL DEPENDS "${doc_files}")
> ++    add_custom_target(doc ALL DEPENDS "${doc_files}")
> ++  endif()
> + endif()
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-devtools/ccache/ccache_4.2.1.bb b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
> index 90b9c6181f..8dd5893d68 100644
> --- a/meta/recipes-devtools/ccache/ccache_4.2.1.bb
> +++ b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
> @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=698a26b57e513d678e1e7727bf56395b"
>   
>   DEPENDS = "zstd"
>   
> -SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
> +SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
> +           file://0001-doc-allow-disabling-docs-man-page-generation.patch \
> +	   "
>   SRC_URI[sha256sum] = "320d2b17d2f76393e5d4bb28c8dee5ca783248e9cd23dff0654694d60f8a4b62"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
> @@ -21,3 +23,5 @@ inherit cmake
>   PATCHTOOL = "patch"
>   
>   BBCLASSEXTEND = "native nativesdk"
> +
> +PACKAGECONFIG[docs] = "-DBUILD_DOCS=ON,-DBUILD_DOCS=OFF,asciidoc"
> 
> 
> 
> 
> 
